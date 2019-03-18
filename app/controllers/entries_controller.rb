class EntriesController < ApplicationController
  def sign_in
  	@name= params[:visitor_name]
    puts "1------------------------------------> #{@name}"
  	ref_e= params[:id].nil?; # true-->nothing in url, false--> something in url
  	ref= params[:id];
    obj_ref=Entry.find_by(unique: ref);
	  valid= Entry.find_by(unique: ref).nil? # true==> fake false==> real
  puts " 1.5 ----------------------------------->#{@name.blank?}  #{Entry.find_by(name: @name).nil?} "
	if !(@name.blank?)
    if (Entry.find_by(name: @name).nil?) 
      @unique_hex= SecureRandom.hex(10);
    	@entry= Entry.create({:name =>@name, :unique => @unique_hex})	
     
      if !(valid) && !(ref_e) 		
	  		obj_ref=Entry.find_by(unique: ref);
      	obj_ref.friend ||= 0;
	  		obj_ref.friend= obj_ref.friend+1;
	  		obj_ref.update({:friend => obj_ref.friend});
        @entry.update({:wrefered => obj_ref.name});
  		end
    end
    redirect_to(:action => 'welcome', :name => @name)
  end
end


def welcome
  name= params[:name];
  full_numb_ref= 20;
  @user= Entry.find_by(name: name)
  @percentage= @user.friend*(100/full_numb_ref);
puts "----------------------11-------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#{@user.friend}*5  #{@percentage}"
	@entries1= Entry.all

end


end
