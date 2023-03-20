import 'package:flutter/material.dart';

class Language {
  static profile(m, l) {
    //
    if (m == 'name') {
      return l == 'th' ? 'ชื่อ' : 'Name';
    }
    if (m == 'nickName') {
      return l == 'th' ? 'ชื่อเล่น' : 'Nick Name';
    }
    if (m == 'myName') {
      return l == 'th' ? 'บัณฑิตชัย อยู่ยง' : 'Bunditchai Yooyong';
    }
    if (m == 'mynickName') {
      return l == 'th' ? 'เจมส์' : 'Jame';
    }
    if (m == 'dateOfbirth') {
      return l == 'th' ? 'วันเกิด' : 'Birth Day';
    }
    if (m == 'age') {
      return l == 'th' ? 'อายุ' : 'Age';
    }
    if (m == 'university') {
      return l == 'th'
          ? 'มหาวิทยาลัยราชภัฏอุตรดิตถ์'
          : 'Uttaradit Rajabhat University';
    }
    if (m == 'group') {
      return l == 'th' ? 'วิศวกรรมคอมพิวเตอร์' : 'Computer Engineering';
    }
    if (m == 'grade') {
      return l == 'th' ? 'วิศวกรรมคอมพิวเตอร์' : 'Grade';
    }
    if (m == 'email') {
      return l == 'th' ? 'อีเมล' : 'Email';
    }
    if (m == 'phone') {
      return l == 'th' ? 'เบอร์โืรศัพท์' : 'Phone Number';
    }
  }

  static myJob(m, l) {
    //job position
    if (m == 'company') {
      return l == 'th' ? 'บริษัท' : 'Company';
    }
    if (m == 'experience') {
      return l == 'th' ? 'ประสบการณ์' : 'Experience';
    }
    if (m == 'jobPosition') {
      return l == 'th' ? 'ตำแหน่งงาน' : 'Job Position';
    }
    if (m == 'Mobile') {
      return l == 'th' ? 'นักพัฒนาแอปพลิเคชัน' : 'Mobile Developer';
    }
    if (m == 'detail') {
      return l == 'th'
          ? 'พัฒนาแอพพลิเคชัน UX, UI โดยในเฟรมเวิร์ค flutter ภาษา dart '
          : 'Develop UX, UI applications in flutter framework dart language.';
    }
  }

  static skill(m, l) {
    //job position
    if (m == 'skill') {
      return l == 'th' ? 'ทักษะ' : 'Skill';
    }
    if (m == 'mainSkill') {
      return l == 'th' ? 'ทักษะหลัก' : 'Skill';
    }
    if (m == 'secondarySkill') {
      return l == 'th' ? 'ทักษะรอง' : 'Secondary Skill';
    }
  }
   static reward(m, l) {
    //job position
    if (m == 'contest') {
      return l == 'th' ? 'ประกวดผลงานวิจัยแห่งชาติ' : 'Contest';
    }
      if (m == 'contestDetail') {
      return l == 'th' ? 'ผลงานประดิษฐ์คิดค้น ผลงานวิจัย และนวัตกรรมของนักวิจัย/นักประดิษฐ์ไทยได้เผยแพร่สู่การใช้ประโยชน์ต่อกลุ่มเป้าหมายในเวทีระดับสากล' : 'Contest';
    }
    if (m == 'mainSkill') {
      return l == 'th' ? 'ทักษะหลัก' : 'Skill';
    }
    if (m == 'secondarySkill') {
      return l == 'th' ? 'ทักษะรอง' : 'Secondary Skill';
    }
    if (m == 'readMore') {
      return l == 'th' ? 'เพิ่มเติม':'Read more';
    }
  }

     static project(m, l) {
    //job position
    if (m == 'project') {
      return l == 'th' ? 'สมาร์ทเฟรม' : 'Smart Fram';
    }
      if (m == 'projectDetail') {
      return l == 'th' ? 'ผลงานประดิษฐ์คิดค้น ผลงานวิจัย และนวัตกรรมของนักวิจัย/นักประดิษฐ์ไทยได้เผยแพร่สู่การใช้ประโยชน์ต่อกลุ่มเป้าหมายในเวทีระดับสากล ผลงานประดิษฐ์คิดค้น ผลงานวิจัย และนวัตกรรมของนักวิจัย/นักประดิษฐ์ไทยได้เผยแพร่สู่การใช้ประโยชน์ต่อกลุ่มเป้าหมายในเวทีระดับสากล' : 'Contest';
    }
    if (m == 'mainSkill') {
      return l == 'th' ? 'ทักษะหลัก' : 'Skill';
    }
    if (m == 'secondarySkill') {
      return l == 'th' ? 'ทักษะรอง' : 'Secondary Skill';
    }
    if (m == 'readMore') {
      return l == 'th' ? 'เพิ่มเติม':'Read more';
    }
  }
}
