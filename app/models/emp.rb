class Emp < ActiveRecord::Base
	has_many :lvs, :dependent => :destroy
	# Validate employee
	#validation_of :emp_number

	has_attached_file :image, styles: { medium: "150x300#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
