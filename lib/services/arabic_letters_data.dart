/// Complete data for all 28 Arabic letters
/// This file should replace the abbreviated version in data_service.dart

import '../models/arabic_letter.dart';

class ArabicLettersData {
  static List<ArabicLetter> getAllLetters() {
    return [
      // 1. Alif (ا)
      ArabicLetter(
        id: 'alif',
        name: 'ألف',
        character: 'ا',
        isolatedForm: 'ا',
        initialForm: 'ا',
        medialForm: 'ـا',
        finalForm: 'ـا',
        englishName: 'Alif',
        order: 1,
        audioPath: 'audio/letters/alif.mp3',
        exampleWords: ['أسد', 'أرنب', 'أحمد'],
        imagePath: 'assets/images/letters/alif.png',
      ),

      // 2. Ba (ب)
      ArabicLetter(
        id: 'ba',
        name: 'باء',
        character: 'ب',
        isolatedForm: 'ب',
        initialForm: 'بـ',
        medialForm: 'ـبـ',
        finalForm: 'ـب',
        englishName: 'Ba',
        order: 2,
        audioPath: 'audio/letters/ba.mp3',
        exampleWords: ['بطة', 'بيت', 'باب'],
        imagePath: 'assets/images/letters/ba.png',
      ),

      // 3. Ta (ت)
      ArabicLetter(
        id: 'ta',
        name: 'تاء',
        character: 'ت',
        isolatedForm: 'ت',
        initialForm: 'تـ',
        medialForm: 'ـتـ',
        finalForm: 'ـت',
        englishName: 'Ta',
        order: 3,
        audioPath: 'audio/letters/ta.mp3',
        exampleWords: ['تفاح', 'تمر', 'تاج'],
        imagePath: 'assets/images/letters/ta.png',
      ),

      // 4. Tha (ث)
      ArabicLetter(
        id: 'tha',
        name: 'ثاء',
        character: 'ث',
        isolatedForm: 'ث',
        initialForm: 'ثـ',
        medialForm: 'ـثـ',
        finalForm: 'ـث',
        englishName: 'Tha',
        order: 4,
        audioPath: 'audio/letters/tha.mp3',
        exampleWords: ['ثعلب', 'ثوم', 'ثلج'],
        imagePath: 'assets/images/letters/tha.png',
      ),

      // 5. Jeem (ج)
      ArabicLetter(
        id: 'jeem',
        name: 'جيم',
        character: 'ج',
        isolatedForm: 'ج',
        initialForm: 'جـ',
        medialForm: 'ـجـ',
        finalForm: 'ـج',
        englishName: 'Jeem',
        order: 5,
        audioPath: 'audio/letters/jeem.mp3',
        exampleWords: ['جمل', 'جبن', 'جزر'],
        imagePath: 'assets/images/letters/jeem.png',
      ),

      // 6. Ha (ح)
      ArabicLetter(
        id: 'ha',
        name: 'حاء',
        character: 'ح',
        isolatedForm: 'ح',
        initialForm: 'حـ',
        medialForm: 'ـحـ',
        finalForm: 'ـح',
        englishName: 'Ha',
        order: 6,
        audioPath: 'audio/letters/ha.mp3',
        exampleWords: ['حصان', 'حليب', 'حديقة'],
        imagePath: 'assets/images/letters/ha.png',
      ),

      // 7. Kha (خ)
      ArabicLetter(
        id: 'kha',
        name: 'خاء',
        character: 'خ',
        isolatedForm: 'خ',
        initialForm: 'خـ',
        medialForm: 'ـخـ',
        finalForm: 'ـخ',
        englishName: 'Kha',
        order: 7,
        audioPath: 'audio/letters/kha.mp3',
        exampleWords: ['خروف', 'خبز', 'خيار'],
        imagePath: 'assets/images/letters/kha.png',
      ),

      // 8. Dal (د)
      ArabicLetter(
        id: 'dal',
        name: 'دال',
        character: 'د',
        isolatedForm: 'د',
        initialForm: 'د',
        medialForm: 'ـد',
        finalForm: 'ـد',
        englishName: 'Dal',
        order: 8,
        audioPath: 'audio/letters/dal.mp3',
        exampleWords: ['دب', 'دجاج', 'دراجة'],
        imagePath: 'assets/images/letters/dal.png',
      ),

      // 9. Thal (ذ)
      ArabicLetter(
        id: 'thal',
        name: 'ذال',
        character: 'ذ',
        isolatedForm: 'ذ',
        initialForm: 'ذ',
        medialForm: 'ـذ',
        finalForm: 'ـذ',
        englishName: 'Thal',
        order: 9,
        audioPath: 'audio/letters/thal.mp3',
        exampleWords: ['ذهب', 'ذئب', 'ذرة'],
        imagePath: 'assets/images/letters/thal.png',
      ),

      // 10. Ra (ر)
      ArabicLetter(
        id: 'ra',
        name: 'راء',
        character: 'ر',
        isolatedForm: 'ر',
        initialForm: 'ر',
        medialForm: 'ـر',
        finalForm: 'ـر',
        englishName: 'Ra',
        order: 10,
        audioPath: 'audio/letters/ra.mp3',
        exampleWords: ['رمان', 'ريش', 'رأس'],
        imagePath: 'assets/images/letters/ra.png',
      ),

      // 11. Zay (ز)
      ArabicLetter(
        id: 'zay',
        name: 'زاي',
        character: 'ز',
        isolatedForm: 'ز',
        initialForm: 'ز',
        medialForm: 'ـز',
        finalForm: 'ـز',
        englishName: 'Zay',
        order: 11,
        audioPath: 'audio/letters/zay.mp3',
        exampleWords: ['زرافة', 'زيت', 'زهرة'],
        imagePath: 'assets/images/letters/zay.png',
      ),

      // 12. Seen (س)
      ArabicLetter(
        id: 'seen',
        name: 'سين',
        character: 'س',
        isolatedForm: 'س',
        initialForm: 'سـ',
        medialForm: 'ـسـ',
        finalForm: 'ـس',
        englishName: 'Seen',
        order: 12,
        audioPath: 'audio/letters/seen.mp3',
        exampleWords: ['سمك', 'سيارة', 'سماء'],
        imagePath: 'assets/images/letters/seen.png',
      ),

      // 13. Sheen (ش)
      ArabicLetter(
        id: 'sheen',
        name: 'شين',
        character: 'ش',
        isolatedForm: 'ش',
        initialForm: 'شـ',
        medialForm: 'ـشـ',
        finalForm: 'ـش',
        englishName: 'Sheen',
        order: 13,
        audioPath: 'audio/letters/sheen.mp3',
        exampleWords: ['شمس', 'شجرة', 'شارع'],
        imagePath: 'assets/images/letters/sheen.png',
      ),

      // 14. Sad (ص)
      ArabicLetter(
        id: 'sad',
        name: 'صاد',
        character: 'ص',
        isolatedForm: 'ص',
        initialForm: 'صـ',
        medialForm: 'ـصـ',
        finalForm: 'ـص',
        englishName: 'Sad',
        order: 14,
        audioPath: 'audio/letters/sad.mp3',
        exampleWords: ['صقر', 'صابون', 'صديق'],
        imagePath: 'assets/images/letters/sad.png',
      ),

      // 15. Dad (ض)
      ArabicLetter(
        id: 'dad',
        name: 'ضاد',
        character: 'ض',
        isolatedForm: 'ض',
        initialForm: 'ضـ',
        medialForm: 'ـضـ',
        finalForm: 'ـض',
        englishName: 'Dad',
        order: 15,
        audioPath: 'audio/letters/dad.mp3',
        exampleWords: ['ضفدع', 'ضوء', 'ضحك'],
        imagePath: 'assets/images/letters/dad.png',
      ),

      // 16. Ta (ط)
      ArabicLetter(
        id: 'ta_heavy',
        name: 'طاء',
        character: 'ط',
        isolatedForm: 'ط',
        initialForm: 'طـ',
        medialForm: 'ـطـ',
        finalForm: 'ـط',
        englishName: 'Ta (Heavy)',
        order: 16,
        audioPath: 'audio/letters/ta_heavy.mp3',
        exampleWords: ['طائر', 'طبيب', 'طماطم'],
        imagePath: 'assets/images/letters/ta_heavy.png',
      ),

      // 17. Za (ظ)
      ArabicLetter(
        id: 'za',
        name: 'ظاء',
        character: 'ظ',
        isolatedForm: 'ظ',
        initialForm: 'ظـ',
        medialForm: 'ـظـ',
        finalForm: 'ـظ',
        englishName: 'Za',
        order: 17,
        audioPath: 'audio/letters/za.mp3',
        exampleWords: ['ظرف', 'ظهر', 'ظل'],
        imagePath: 'assets/images/letters/za.png',
      ),

      // 18. Ayn (ع)
      ArabicLetter(
        id: 'ayn',
        name: 'عين',
        character: 'ع',
        isolatedForm: 'ع',
        initialForm: 'عـ',
        medialForm: 'ـعـ',
        finalForm: 'ـع',
        englishName: 'Ayn',
        order: 18,
        audioPath: 'audio/letters/ayn.mp3',
        exampleWords: ['عصفور', 'عنب', 'عين'],
        imagePath: 'assets/images/letters/ayn.png',
      ),

      // 19. Ghayn (غ)
      ArabicLetter(
        id: 'ghayn',
        name: 'غين',
        character: 'غ',
        isolatedForm: 'غ',
        initialForm: 'غـ',
        medialForm: 'ـغـ',
        finalForm: 'ـغ',
        englishName: 'Ghayn',
        order: 19,
        audioPath: 'audio/letters/ghayn.mp3',
        exampleWords: ['غراب', 'غيمة', 'غزال'],
        imagePath: 'assets/images/letters/ghayn.png',
      ),

      // 20. Fa (ف)
      ArabicLetter(
        id: 'fa',
        name: 'فاء',
        character: 'ف',
        isolatedForm: 'ف',
        initialForm: 'فـ',
        medialForm: 'ـفـ',
        finalForm: 'ـف',
        englishName: 'Fa',
        order: 20,
        audioPath: 'audio/letters/fa.mp3',
        exampleWords: ['فيل', 'فراشة', 'فم'],
        imagePath: 'assets/images/letters/fa.png',
      ),

      // 21. Qaf (ق)
      ArabicLetter(
        id: 'qaf',
        name: 'قاف',
        character: 'ق',
        isolatedForm: 'ق',
        initialForm: 'قـ',
        medialForm: 'ـقـ',
        finalForm: 'ـق',
        englishName: 'Qaf',
        order: 21,
        audioPath: 'audio/letters/qaf.mp3',
        exampleWords: ['قطة', 'قمر', 'قلب'],
        imagePath: 'assets/images/letters/qaf.png',
      ),

      // 22. Kaf (ك)
      ArabicLetter(
        id: 'kaf',
        name: 'كاف',
        character: 'ك',
        isolatedForm: 'ك',
        initialForm: 'كـ',
        medialForm: 'ـكـ',
        finalForm: 'ـك',
        englishName: 'Kaf',
        order: 22,
        audioPath: 'audio/letters/kaf.mp3',
        exampleWords: ['كتاب', 'كرة', 'كلب'],
        imagePath: 'assets/images/letters/kaf.png',
      ),

      // 23. Lam (ل)
      ArabicLetter(
        id: 'lam',
        name: 'لام',
        character: 'ل',
        isolatedForm: 'ل',
        initialForm: 'لـ',
        medialForm: 'ـلـ',
        finalForm: 'ـل',
        englishName: 'Lam',
        order: 23,
        audioPath: 'audio/letters/lam.mp3',
        exampleWords: ['ليمون', 'لعبة', 'لحم'],
        imagePath: 'assets/images/letters/lam.png',
      ),

      // 24. Meem (م)
      ArabicLetter(
        id: 'meem',
        name: 'ميم',
        character: 'م',
        isolatedForm: 'م',
        initialForm: 'مـ',
        medialForm: 'ـمـ',
        finalForm: 'ـم',
        englishName: 'Meem',
        order: 24,
        audioPath: 'audio/letters/meem.mp3',
        exampleWords: ['ماء', 'موز', 'مدرسة'],
        imagePath: 'assets/images/letters/meem.png',
      ),

      // 25. Noon (ن)
      ArabicLetter(
        id: 'noon',
        name: 'نون',
        character: 'ن',
        isolatedForm: 'ن',
        initialForm: 'نـ',
        medialForm: 'ـنـ',
        finalForm: 'ـن',
        englishName: 'Noon',
        order: 25,
        audioPath: 'audio/letters/noon.mp3',
        exampleWords: ['نمر', 'نحلة', 'نجمة'],
        imagePath: 'assets/images/letters/noon.png',
      ),

      // 26. Ha (ه)
      ArabicLetter(
        id: 'ha_end',
        name: 'هاء',
        character: 'ه',
        isolatedForm: 'ه',
        initialForm: 'هـ',
        medialForm: 'ـهـ',
        finalForm: 'ـه',
        englishName: 'Ha (End)',
        order: 26,
        audioPath: 'audio/letters/ha_end.mp3',
        exampleWords: ['هدية', 'هرم', 'هواء'],
        imagePath: 'assets/images/letters/ha_end.png',
      ),

      // 27. Waw (و)
      ArabicLetter(
        id: 'waw',
        name: 'واو',
        character: 'و',
        isolatedForm: 'و',
        initialForm: 'و',
        medialForm: 'ـو',
        finalForm: 'ـو',
        englishName: 'Waw',
        order: 27,
        audioPath: 'audio/letters/waw.mp3',
        exampleWords: ['وردة', 'وجه', 'ولد'],
        imagePath: 'assets/images/letters/waw.png',
      ),

      // 28. Ya (ي)
      ArabicLetter(
        id: 'ya',
        name: 'ياء',
        character: 'ي',
        isolatedForm: 'ي',
        initialForm: 'يـ',
        medialForm: 'ـيـ',
        finalForm: 'ـي',
        englishName: 'Ya',
        order: 28,
        audioPath: 'audio/letters/ya.mp3',
        exampleWords: ['يد', 'يوم', 'ياسمين'],
        imagePath: 'assets/images/letters/ya.png',
      ),
    ];
  }
}
