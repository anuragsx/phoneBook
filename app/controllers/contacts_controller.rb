class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
		3.times do
	      @contact.phone_numbers << PhoneNumber.new
	      @contact.postal_addresses << PostalAddress.new
	    end
	end	

	def show
	end	

	def edit
	end

	def create
		@contact = Contact.new(contact_params)
		if params["contact"]["phone_numbers_attributes"].present?
			params["contact"]["phone_numbers_attributes"].each do |phone|
				if phone["phone_no"].present?
				   @contact.phone_numbers.create(phone_no: phone["phone_no"])
				end
		  	end
	  	end
		if params["contact"]["postal_addresses_attributes"].present?
			params["contact"]["postal_addresses_attributes"].each do |address|
				if address["address"].present?
				   @contact.postal_addresses.create(address: address["address"])
				end
		  	end
	  	end

	    respond_to do |format|
	      if @contact.save
	        format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
  	end

	def update
		if params["contact"]["phone_numbers_attributes"].present?
			params["contact"]["phone_numbers_attributes"].each do |phone|
				if phone["phone_no"].present?
				   @contact.phone_numbers.create(phone_no: phone["phone_no"])
				end
		  	end
	  	end
		if params["contact"]["postal_addresses_attributes"].present?
			params["contact"]["postal_addresses_attributes"].each do |address|
				if address["address"].present?
				   @contact.postal_addresses.create(address: address["address"])
				end
		  	end
	  	end		
		respond_to do |format|
		  if @contact.update(contact_params)
		    format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
		  else
		    format.html { render :edit }
		  end
		end
	end


	def destroy
		@contact.destroy
		respond_to do |format|
			format.html { redirect_to contacts_path, notice: 'Contact was successfully destroyed.' }
			format.json { head :no_content }
		end
	end  	

  private

	def set_contact
	  @contact = Contact.find(params[:id])
	end

	def contact_params
	  params.require(:contact).permit(:name, 
	  								  :phone_numbers_attributes => [:id, :phone_no, :contact_id], 
	  								  :postal_addresses_attributes => [:id, :address, :contact_id])
	end

end
