// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieItemImpl _$$MovieItemImplFromJson(Map<String, dynamic> json) =>
    _$MovieItemImpl(
      backdropPath: json['backdropPath'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      genres: json['genres'] as String?,
      id: (json['id'] as num?)?.toInt(),
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      posterUrl: json['posterUrl'] as String?,
      releaseDate: json['releaseDate'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      formattedVoteAverage: json['formattedVoteAverage'] as String?,
      voteCount: (json['voteCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MovieItemImplToJson(_$MovieItemImpl instance) =>
    <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'genres': instance.genres,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'posterUrl': instance.posterUrl,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'formattedVoteAverage': instance.formattedVoteAverage,
      'voteCount': instance.voteCount,
    };
