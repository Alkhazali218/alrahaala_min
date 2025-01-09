class OnBoardingModel {
  final String lottieURL;
  final String title;
  final String subtitle;

  OnBoardingModel(this.lottieURL,this.title,this.subtitle);
}

List<OnBoardingModel> onboardintItems = [
  OnBoardingModel(
    'https://lottie.host/c9ad816a-74f2-4c99-8ebb-d9657925db77/M2Cm2vjH3O.json',
    'ابدأ رحلتك المالية',
    'مع تطبيق الرحالة في إرسال واستقبال الحوالات بكل سهولة وأمان',
  ),
  OnBoardingModel(
    'https://lottie.host/013978f8-566f-475a-912d-495e542a26ff/BrfhtgwWTa.json',
    'استمر بالتحويلات',
    'نحن نقدم لك أفضل الحلول للتحويلات المالية بأسعار تنافسية في أي وقت',
  ),
  OnBoardingModel(
    'https://lottie.host/0a007d8f-bf1c-4cf3-8c2e-c0e73b02d447/mpDBLYkM2J.json',
    'النقطة النهائية',
    'سواء كنت ترسل أو تستقبل الأموال إلى هدفك المالي أصبح أسهل وأسرع',
  ),
];
