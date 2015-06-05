require 'pusher'
$pusher = Pusher::Client.new app_id: '121522', key: '028a87de58f9d41e6158', secret: 'cead6bbd1b740a5eb988'

class LineProcess
  include Sidekiq::Worker
	  def perform(event_id)
      @event = Event.find(event_id)
      @line = @event.line
      @line_id = @line.id
    #  if @line.already_start == true
    #    puts "line already_start!"
    #    return
    #  else
      @line.already_start = true
      @line.save
      puts 'Line started!'
      puts 'Line end time will be '+ @line.end_time.to_s
      while Line.find(@line_id).users_and_lines_relationships.size == 0
      end
      puts 'We have user!'
      puts 'Build 100 robots now'
      build_robots(event_id)
      puts 'Robots build finish'
      @line.next_checkin_time = Time.current() + 60
      @line.save
      puts 'next_checkin_time '+ @line.next_checkin_time.to_s
      @line.users_and_lines_relationships.each do |relation|
        if relation.robot == false
          $pusher.trigger('notification', 'greeting', {
            message: 'Hello '+relation.user.first_name+ '!! Welcome to join event "'+@event.name+'"!'
          })
        end
      end   
       
      while Time.current() < @line.end_time
      
        while Time.current() < @line.end_time and Time.current() < @line.next_checkin_time
        end  
        if Time.current() < @line.end_time
          puts 'New checkin phase.'
          @line.next_checkin_time += 60
          puts 'next_checkin_time '+ @line.next_checkin_time.to_s

          @line.users_and_lines_relationships.each do |relation|
            update_score(relation)
            if relation.robot == false
              $pusher.trigger('notification', 'checkin_notification', {
                message: 'Hello '+relation.user.first_name+ '!! Please confirm within next 30 seconds!'
              })
              relation.send_period_notification = true
              puts 'position '+relation.position.to_s
            
            end    
          #  puts 'score '+relation.score.to_s
             
          end
        end      
      end
      puts "Line is finished."
      @line.users_and_lines_relationships.each do |relation|
        if relation.robot == false
          $pusher.trigger('notification', 'ticket', {
            message: 'Congratulations '+relation.user.first_name+ '!! You got the ticket!'
          })
          puts 'ticket sended '
        end    
      #  puts 'score '+relation.score.to_s
         
      end
    #end  
  end   

    
    def update_score(relation)

      if relation.checkin_current_period == false
          if relation.robot == false
            puts 'no checkin this time.'
          end
          relation.score -= 1
      else
          relation.score += 1
          if relation.robot == false
            puts 'got your checkin.'
          end
      end    
      relation.delta_value = update_delta(relation.delta_value, relation.checkin_current_period, relation.continuous_checkin_count)     
      relation.score += relation.delta_value
      relation.save
      if relation.robot == false
        puts 'score '+relation.score.to_s
        puts 'delta '+relation.delta_value.to_s
      end
    end
    
    def update_delta(delta, checkin_current_period , continuous_checkin_conut)
        if checkin_current_period == true
          delta += continuous_checkin_conut
        elsif delta > 0
          delta /= 2
        elsif delta == 0
          delta -= 1
        else
          delta *= 2
        end  
        delta = delta_bound_fix(delta)  
        return delta
    end

    def delta_bound_fix(delta)
      if delta >= 100
        delta = 100
      end
      if delta <= -100
        delta = -100
      end
      return delta
    end
    
    def build_robots(event_id)
      attend_event = Event.find(event_id)
      line_id = attend_event.line.id
      for id in 100..199
        robot = User.find(id)
        robot.attended_events << attend_event
        robot.lines << attend_event.line
        relation = UsersAndLinesRelationship.find_by(user: id.to_s , line: line_id.to_s)
        relation.robot = true      
        relation.save  

       # puts relation.robot
      end
    end

    
    
end
