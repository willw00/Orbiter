class Free_body
	attr_accessor :mass, :x, :y, :vel_x, :vel_y, :acc_x, :acc_y, :old_acc_x, :old_acc_y

	def initialize(attrs = {})
		@mass = attrs.fetch(:mass, 10)
		@x = attrs.fetch(:x, 0)
		@y = attrs.fetch(:y, 0)
		@vel_x = attrs.fetch(:vel_x, 0)
		@vel_y = attrs.fetch(:vel_y, 0)
		@acc_x = attrs.fetch(:acc_x, 0)
		@acc_y = attrs.fetch(:acc_y, 0)
		@old_acc_x = attrs.fetch(:old_acc_x, 0)
		@old_acc_y = attrs.fetch(:old_acc_y, 0)
	end

end