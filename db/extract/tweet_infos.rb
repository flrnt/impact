require 'json'

json_filepath = '../tweets.json'

@tweets = JSON.parse(File.open(json_filepath).read).first.last


# def nombre_moyen_retweets
#   retweets = []

#   tweets.each do |tweet|
#     retweets << tweet["retweet_count"]
#   end

#   sum = 0
#   retweets.each do |x|
#     sum += x.to_i
#   end

#   moy_retweets = sum / retweets.size
# end

# def nombre_moyen_favoris
#   favorites = []

#   tweets.each do |tweet|
#     favorites << tweet["favorite_count"]
#   end

#   sum = 0
#   favorites.each do |x|
#     sum += x.to_i
#   end

#   moy_favorites = sum / favorites.size
# end

def hashtags_in_tweets
  entities = []
  array_of_hashtags = []
  array_of_hashtags_texts = []


  @tweets.each do |tweet|
    entities << tweet["entities"] if tweet["retweeted_status"].nil? #mettre unless à la place de if pour récupérer les retweets parmis ses tweets
  end

  entities.each do |entity|
    array_of_hashtags << entity["hashtags"]
  end

  array_of_hashtags.each do |hashtag_array|
    unless hashtag_array.empty?
      hashtag_array.each do |hashtag|
        array_of_hashtags_texts << hashtag["text"]
      end
    end
  end

  hash_words = {}
  array_of_hashtags_texts.each do |word|
    if hash_words.key? (word)
      hash_words[word] += 1
    else
      hash_words[word] = 1
    end
  end

  sorted_hash = hash_words.sort_by do |word, frequency|
    frequency
  end
  sorted_hash
end

p hashtags_in_tweets



# def screen_names_in_tweets
#   entities = []
#   user_mentions = []
#   screen_names = []


#   tweets.each do |tweet|
#     entities << tweet["entities"]
#   end

#   entities.each do |entity|
#     user_mentions << entity["user_mentions"]
#   end

#   user_mentions.each do |user_mentions_array|
#     unless user_mentions_array.empty?
#       user_mentions_array.each do |user_mention|
#         screen_names << user_mention["screen_name"]
#       end
#     end
#   end
# end



