module EmployeesHelper

	def generate_unique_token
      token = Digest::SHA1.hexdigest([Time.now, rand].join)
      token
    end
end
