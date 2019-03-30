class EntriesController < ApplicationController
  def sign_in
#  	@name= params[:visitor_name]
    @email= params[:email]
    puts "1------------------------------------> #{@email}"
  	ref_e= params[:id].nil?; # true-->nothing in url, false--> something in url
  	ref= params[:id];
    obj_ref=Entry.find_by(unique: ref);
	  valid= Entry.find_by(unique: ref).nil? # true==> fake false==> real

    puts " 1.5 ----------------------------------->sentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsentsent "

    @visited = false
    if Entry.find_by(ip: request.remote_ip)
      @visited = true
    end

	if !@email.blank? && !@visited
     if @email.match(URI::MailTo::EMAIL_REGEXP).present?
    if (Entry.find_by(email: @email).nil?) 
      @unique_hex= SecureRandom.hex(10);
      UserMailer.signup_confirmation(@email).deliver
    	@entry= Entry.create({:email => @email, :unique => @unique_hex, :ip => request.remote_ip})
     
      if !(valid) && !(ref_e) 		
	  		obj_ref=Entry.find_by(unique: ref);
      	obj_ref.friend ||= 0;
	  		obj_ref.friend= obj_ref.friend+1;
	  		obj_ref.update({:friend => obj_ref.friend});
        @entry.update({:wrefered => obj_ref.email});
  		end
    end
    redirect_to(:action => 'welcome', :email => @email)
   end
  puts "------------------->1"
  end
  puts "----------------->2"

end


def welcome
  email= params[:email];
  full_numb_ref= 20;
  @user= Entry.find_by(email: email)
  @unique= @user.unique
  puts "-------------------------------------------___>>>>>>>>>>>>>>> #{@unique}"
  @percentage= @user.friend*(100/full_numb_ref);
puts "----------------------11-------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@user.friend}*5  #{@percentage}"
	@entries1= Entry.all

end


end
