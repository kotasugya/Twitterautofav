require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "BEpIIAGfMF99QPJCRIOsNMvIF"
  config.consumer_secret     = "uF9YAwdVPMekmICACZ24EkufoDCK67vXmaHVp4TctnvICH32jv"
  config.access_token        = "1336097772559192067-0KYnGKnYTQxeuU4rOtPjZgL5sckHUs"
  config.access_token_secret = "HQE1HPdM3VWSEDvbVJKQmM6zBIfAeNSIOD4PFSRkl8v43"
end

tag_list = ["#駆け出しエンジニアと繋がりたい", "#プログラミング初心者", "#今日の積み上げ",
            "#Progate","#プログラミング学習", "#勉強垢", "#ZONE", "#ブログ初心者"
           ]

tag_list.each do |tag|
  results = client.search(tag, :count => 30, :result_type => "recent")
    results.attrs[:statuses].each do |tweet|
      id = tweet[:id].to_s
      client.favorite(id)
    end
end