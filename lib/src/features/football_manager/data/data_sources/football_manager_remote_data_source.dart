import '../../../../ui/organisms/interactive_player/entities/interaction_entity.dart';

abstract class FootballManagerRemoteDataSource {
  Future<InteractionEntity> footballManagerTrailer();
}

class FootballManagerRemoteDataSourceImpl
    implements FootballManagerRemoteDataSource {
  @override
  Future<InteractionEntity> footballManagerTrailer() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mock;
  }
}

const _baseUrl =
    'https://raw.githubusercontent.com/pratikpwr/non-linear-video-player/master/assets/videos/';

const _mock = InteractionEntity(
  videoUrl: '${_baseUrl}A.mp4',
  title: 'Every Decision Counts',
  question: 'Which club you want to Join?',
  options: [
    InteractionEntity(
      videoUrl: '${_baseUrl}B0.mp4',
      title: 'Hamburger SV',
      question: 'Is this a project you want to be a part of?',
      options: [
        InteractionEntity(
          videoUrl: '${_baseUrl}B0C0.mp4',
          title: 'Negotiate Objective',
          question: null,
          options: [],
        ),
        InteractionEntity(
          videoUrl: '${_baseUrl}B0C1.mp4',
          title: 'Accept Objective',
          question: 'Choose a tactical style?',
          options: [
            InteractionEntity(
              videoUrl: '${_baseUrl}B0C1D0.mp4',
              title: 'Counter Attack',
              question: null,
              options: [],
            ),
            InteractionEntity(
              videoUrl: '${_baseUrl}B0C1D1.mp4',
              title: 'Vertical Tiki-Taka',
              question: null,
              options: [],
            ),
          ],
        ),
        InteractionEntity(
          videoUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          title: 'Random Bee Video',
          question: 'Next Video?',
          options: [
            InteractionEntity(
              videoUrl:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              title: 'Random Butterfly Video',
              question: null,
              options: [],
            ),
          ],
        ),
      ],
    ),
    InteractionEntity(
      videoUrl: '${_baseUrl}B1.mp4',
      title: 'AS Saint-Étienne',
      question: 'What you will decide?',
      options: [
        InteractionEntity(
          videoUrl: '${_baseUrl}B1C0.mp4',
          title: 'Promote to first team',
          question: '',
          options: [],
        ),
        InteractionEntity(
          videoUrl: '${_baseUrl}B1C1.mp4',
          title: 'Offer for loan',
          question: 'What you want to do to loan player?',
          options: [
            InteractionEntity(
              videoUrl: '${_baseUrl}B1C1D0.mp4',
              title: 'Find improved loan',
              question: '',
              options: [],
            ),
            InteractionEntity(
              videoUrl: '${_baseUrl}B1C1D1.mp4',
              title: 'Promise game time',
              question: '',
              options: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
