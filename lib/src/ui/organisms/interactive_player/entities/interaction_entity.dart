class InteractiveEntity {
  final String videoUrl;
  final String title;
  final String? question;
  final List<InteractiveEntity> options;

  const InteractiveEntity({
    required this.videoUrl,
    required this.title,
    required this.question,
    required this.options,
  });

  bool get isLast => options.isEmpty;
}

const mock = InteractiveEntity(
  videoUrl:
      'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/A.mp4?alt=media&token=c4438011-544b-4fce-95da-d0527dadd029',
  title: 'Every Decision Matters',
  question: 'Which club you want to Join?',
  options: [
    InteractiveEntity(
      videoUrl:
          'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B0.mp4?alt=media&token=528369a6-fe59-48a3-8f38-392b9d8d932b',
      title: 'Hamburger SV',
      question: 'Is this a project you want to be a part of?',
      options: [
        InteractiveEntity(
          videoUrl:
              'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B0C0.mp4?alt=media&token=7fa3670e-0245-4681-98d0-0af1c275c8a9',
          title: 'Negotiate Objective',
          question: null,
          options: [],
        ),
        InteractiveEntity(
          videoUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          title: 'Bee',
          question: null,
          options: [
            InteractiveEntity(
              videoUrl:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              title: 'Butterfly',
              question: null,
              options: [],
            ),
          ],
        ),
        InteractiveEntity(
          videoUrl:
              'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B0C1.mp4?alt=media&token=7b4fd06c-2e07-42a8-8736-79f5bb972e0e',
          title: 'Accept Objective',
          question: 'Choose a tactical style',
          options: [
            InteractiveEntity(
              videoUrl:
                  'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B0C1D0.mp4?alt=media&token=e9172edd-179d-4e27-b6a1-a1933f03e5b5',
              title: 'Counter Attack',
              question: null,
              options: [],
            ),
            InteractiveEntity(
              videoUrl:
                  'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B0C1D1.mp4?alt=media&token=fbd3d7b0-567b-45b3-a4fb-cc3e50e78b9d',
              title: 'Vertical Tiki-Taka',
              question: null,
              options: [],
            ),
          ],
        ),
      ],
    ),
    InteractiveEntity(
      videoUrl:
          'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B1.mp4?alt=media&token=a32fc77c-a7e4-4743-acc6-aed4889dd09d',
      title: 'AS Saint-Étienne',
      question: 'What you will decide?',
      options: [
        InteractiveEntity(
          videoUrl:
              'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B1C0.mp4?alt=media&token=f3f6ba35-231b-42d2-8bb2-ee914ec16d11',
          title: 'Promote to first team',
          question: '',
          options: [],
        ),
        InteractiveEntity(
          videoUrl:
              'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B1C1.mp4?alt=media&token=8a3de444-7aa5-4740-b2d3-58ca5b5a9b26',
          title: 'Offer for loan',
          question: 'What you want to do to loan player?',
          options: [
            InteractiveEntity(
              videoUrl:
                  'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B1C1D0.mp4?alt=media&token=c0677031-6688-428a-902b-600bc72f6369',
              title: 'Find improved loan',
              question: '',
              options: [],
            ),
            InteractiveEntity(
              videoUrl:
                  'https://firebasestorage.googleapis.com/v0/b/rent-a-gf.appspot.com/o/B1C1D1.mp4?alt=media&token=197175a8-63ff-41a9-8035-5d517fad5708',
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
