from django.urls import path

from . import views

urlpatterns = [
    path('tweets', views.tweet_list),
    path('tweets/<int:id>', views.tweet_list),
    path('tweets/<int:id>/retweet', views.tweet_retweet),
]