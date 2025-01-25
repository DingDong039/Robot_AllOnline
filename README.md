# Robot AllMember Online

# โปรเจกต์ทดสอบอัตโนมัติด้วย Robot Framework

โปรเจกต์นี้ใช้ **Robot Framework** และ **SeleniumLibrary** ในการทดสอบการทำงานของเว็บไซต์ CPALL (7-Eleven) โดยอัตโนมัติ เช่น การสั่งซื้อสินค้าผ่านเว็บไซต์และการลงทะเบียนสมาชิกใหม่

## การติดตั้ง

1. ติดตั้ง **Python**:
   - ดาวน์โหลดและติดตั้ง Python จาก [python.org](https://www.python.org/)

2. ติดตั้ง **Robot Framework** และ **SeleniumLibrary**:
   - เปิด Terminal หรือ Command Prompt และติดตั้ง Robot Framework โดยการใช้คำสั่ง:
     ```bash
     pip install robotframework
     ```
   - ติดตั้ง SeleniumLibrary:
     ```bash
     pip install robotframework-seleniumlibrary
     ```

3. ติดตั้ง **WebDriver** สำหรับเบราว์เซอร์ที่ใช้:
   - ถ้าคุณใช้ Chrome:
     - ดาวน์โหลด [ChromeDriver](https://sites.google.com/chromium.org/driver/) และตั้งค่าตำแหน่งให้ถูกต้องในระบบ

## การตั้งค่า

1. สร้างไฟล์ **.robot** และระบุ URL และตัวแปรที่ใช้ในการทดสอบ:
   - เช่น URL ของเว็บไซต์ที่คุณจะทดสอบ
   - ข้อมูลผู้ใช้สำหรับการเข้าสู่ระบบ เช่น อีเมล รหัสผ่าน เบอร์โทรศัพท์ รหัสร้าน และชื่อสินค้า

2. แยกการทำงานใน **Keywords** สำหรับการทำงานแต่ละขั้นตอน เช่น การเข้าสู่ระบบ การเลือกสินค้า การชำระเงิน และการตรวจสอบข้อมูลต่างๆ
