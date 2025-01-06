class OnBoardingModel {
  final String lottieURL;
  final String title;
  final String subtitle;

  OnBoardingModel(this.lottieURL,this.title,this.subtitle);
}

List<OnBoardingModel> onboardintItems = [
  OnBoardingModel(
    'https://lottie.host/c9ad816a-74f2-4c99-8ebb-d9657925db77/M2Cm2vjH3O.json',
     'start Journey',
      'when you make a journey, \nyou travel from one place to another n place to enjoy',
      ),
       OnBoardingModel(
    'https://lottie.host/013978f8-566f-475a-912d-495e542a26ff/BrfhtgwWTa.json',
     'Continue',
      'we make it simple to find the \nbast way to travel. Every journey \nis not easy',
      ),
        OnBoardingModel(
    'https://lottie.host/0a007d8f-bf1c-4cf3-8c2e-c0e73b02d447/mpDBLYkM2J.json',
     'Final Point',
      'Dream point every rider, \n during the journey of every place and poinl',
      ),
];