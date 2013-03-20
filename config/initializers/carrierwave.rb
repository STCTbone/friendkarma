CarrierWave.configure do |config|
	config.root = Rails.root.join('tmp') # adding these...
	  config.cache_dir = 'carrierwave' # ...two lines


	  config.fog_credentials = {
		:provider               => 'AWS',                        # required
		:aws_access_key_id      => '18RH5BPY7EWZ9J662TR2',                        # required
		:aws_secret_access_key  => 'HNJAWJJlJT997N8kt2dgieiybHoM4Qhd2bXY1n3i',                        # required
}
		config.fog_directory  = 'FriendKarma'                     # required
end
