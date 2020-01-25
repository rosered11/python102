from rest_framework import serializers
from tweet.models import Tweet

class TweetSerializer(serializers.ModelSerializer):
    body = serializers.CharField(max_length=100,required=None)
    is_retweet = serializers.BooleanField(default=False)

    class Meta:
        model = Tweet
        fields = ['id','body','is_retweet','author','created_at','updated_at']

    def create(self, validated_data):
        """
        Create and return a new `Tweet` instance, given the validated data.
        """
        return Tweet.objects.create(**validated_data)

    def update(self, instance, validated_data):
        """
        Update and return an existing `Tweet` instance, given the validated data.
        """
        instance.body = validated_data["body"]
        instance.save()
        return instance