require 'pusher'
$pusher = Pusher::Client.new app_id: '121522', key: '028a87de58f9d41e6158', secret: 'cead6bbd1b740a5eb988'

class LineProcess
  include Sidekiq::Worker
	  def perform(event_id)
      $pusher.trigger('notification', 'new_notification', {
        message: 'Hello ' + '!! Welcome to join event "' + '"!'
      })
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
      while Line.find(@line_id).users_and_lines_relationships.size == 0
      end
      puts 'We have user!'
      puts 'Build 100 robots now'
      build_robots(event_id)
      puts 'Robots build finish'
      @line.next_checkin_time = Time.current() + 60
      @line.save
      puts @line.next_checkin_time
      @line.users_and_lines_relationships.each do |relation|
        puts 'robot '+ relation.robot.to_s
        if relation.user.first_name != nil
          $pusher.trigger('notification', 'new_notification', {
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
          @line.users_and_lines_relationships.each do |relation|
            update_score(relation)
            if relation.user.first_name != nil
              $pusher.trigger('notification', 'new_notification', {
                message: 'Hello '+relation.user.first_name+ '!! Please confirm within next 30 seconds!'
              })
              relation.send_period_notification = true
            end    
            puts 'score '+relation.score.to_s
            puts 'position '+relation.position.to_s
             
          end
        end      
      end
      puts "Line is finished."
    #end  
  end   

    
    def update_score(relation)

      if relation.checkin_current_period == false
          puts 'no checkin this time.'
          relation.score -= 1
      else
          relation.score += 1
          puts 'got your checkin.'
      end    
      relation.delta_value = update_delta(relation.delta_value, relation.checkin_current_period, relation.continuous_checkin_count)     
      relation.score += relation.delta_value
      relation.save
    #  puts 'score '+relation.score.to_s
      puts 'delta '+relation.delta_value.to_s
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
      @attend_event = Event.find(event_id)
      for id in 100..199
        robot = User.find(id)
        robot.attended_events << @attend_event
        robot.lines << @attend_event.line
        robot.users_and_lines_relationships.where(line: @attend_event.line).take.robot = true
        robot.save
        puts '1 '+@attend_event.line.users_and_lines_relationships.where(user: robot).take.robot.to_s
        puts '2 '+robot.users_and_lines_relationships.where(line: @attend_event.line).take.robot.to_s
         
        robot.save
      end
    end

    
    
end
