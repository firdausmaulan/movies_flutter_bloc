// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailImpl _$$MovieDetailImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailImpl(
      adult: json['adult'] as bool?,
      backdropPath: json['backdropPath'] as String?,
      backdropUrl: json['backdropUrl'] as String?,
      belongsToCollection: json['belongsToCollection'] == null
          ? null
          : BelongsToCollection.fromJson(
              json['belongsToCollection'] as Map<String, dynamic>),
      budget: (json['budget'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: (json['id'] as num?)?.toInt(),
      imdbId: json['imdbId'] as String?,
      originCountry: (json['originCountry'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalLanguage: json['originalLanguage'] as String?,
      originalTitle: json['originalTitle'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['posterPath'] as String?,
      productionCompanies: (json['productionCompanies'] as List<dynamic>?)
          ?.map((e) => ProductionCompanies.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['productionCountries'] as List<dynamic>?)
          ?.map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['releaseDate'] as String?,
      revenue: (json['revenue'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguages.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MovieDetailImplToJson(_$MovieDetailImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'backdropUrl': instance.backdropUrl,
      'belongsToCollection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originCountry': instance.originCountry,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'releaseDate': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spokenLanguages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
