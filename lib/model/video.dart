class VideoModel{
  String videoTitle, videoUrl, createdAt;

  VideoModel( this.videoTitle, this.videoUrl, this.createdAt);

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return new VideoModel(
      json['title'],
      json['videoUrl'],
      json['createdAt'],
    );
  }
}