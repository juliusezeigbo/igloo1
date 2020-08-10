if Rails.env.production?
        CarrierWave.configure do |configure|
         config.fog_credentials ={
          #configuration for Amazon S3
         :provider  =>                  'AWS',
         :aws_access_key_id =>          ENV["AKIAJMSNOG6ZJC7UT53A"],
         :aws_secret_access_key =>      ENV["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"],
        }
        config.fog_directory	=       ENV["teamfoxtrot2020"]
    end
end
