/*
 * *
 *  * Created by trisha dubey {https://www.linkedin.com/in/trisha-dubey-802b79157/} on 10/19/23, 7:24 PM
 *  * Copyright (c) 2023 . All rights reserved.
 *  * Last modified 10/19/23, 6:55 PM
 *
 */

class NewsListModel {
  NewsListModel({
    required this.pagination,
    required this.data,
  });

  final Pagination? pagination;
  final List<News> data;

  factory NewsListModel.fromJson(Map<String, dynamic> json){
    return NewsListModel(
      pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      data: json["data"] == null ? [] : List<News>.from(json["data"]!.map((x) => News.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "pagination": pagination?.toJson(),
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class News {
  News({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.source,
    required this.image,
    required this.category,
    required this.language,
    required this.country,
    required this.publishedAt,
  });

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? source;
  final String? image;
  final String? category;
  final String? language;
  final String? country;
  final DateTime? publishedAt;

  factory News.fromJson(Map<String, dynamic> json){
    return News(
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      source: json["source"],
      image: json["image"],
      category: json["category"],
      language: json["language"],
      country: json["country"],
      publishedAt: DateTime.tryParse(json["published_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "source": source,
    "image": image,
    "category": category,
    "language": language,
    "country": country,
    "published_at": publishedAt?.toIso8601String(),
  };

}

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  final int? limit;
  final int? offset;
  final int? count;
  final int? total;

  factory Pagination.fromJson(Map<String, dynamic> json){
    return Pagination(
      limit: json["limit"],
      offset: json["offset"],
      count: json["count"],
      total: json["total"],
    );
  }

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "offset": offset,
    "count": count,
    "total": total,
  };

}
