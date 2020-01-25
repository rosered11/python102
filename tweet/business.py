from tweet.serializers import TweetSerializer

class TweetManagement:

    def f(self):
        return 'hello world'

    def retweet_new(self,old_data,request_tweet_data):
        data = request_tweet_data
        data["is_retweet"] = True
        data["author"] = old_data.author
        data["owner"] = old_data.owner
        return TweetSerializer(data=data)
