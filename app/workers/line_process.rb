require 'pusher'
$pusher = Pusher::Client.new app_id: '121522', key: '028a87de58f9d41e6158', secret: 'cead6bbd1b740a5eb988'

class LineProcess
  include Sidekiq::Worker
	  def perform(event_id)
	      @event = Event.find(event_id)
          @line = @event.line
          @user  = User.find(1)
          puts @user.phone_number
          puts @event.name
          puts @event.id
          puts @line.id
          if @user.users_and_lines_relationships != nil 
            puts "we have relationships."
          else
            puts "sorry we have not."
          end
          puts @user.users_and_lines_relationships.find(@line)
          puts "i am here."
      #    puts @user.users_and_lines_relationships.where("line =  ?", @line).score
	    #  update_score(3)
    	  $pusher.trigger('notification', 'new_notification', {
            message: 'hello fff!! You are attending '+@event.name+' right now!'
          })
                
      end
    

    
    def update_score(user_id)
        @user = User.find(user_id)
        if @user.checkin_current_period == false
            puts @user.first_name
        else
            @user.score += 1
        end    
        @user.delta_value = update_delta(@user.delta_value, @user.checkin_current_period, @user.continuous_checkin_current_period)     
        @user.score += @user.delta_value
        @user.save
        puts @user.score
        puts @user.delta_value
    end
     def update_delta(delta, checkin_current_period , continuous_checkin_conut)
           
    end
   
    
end
