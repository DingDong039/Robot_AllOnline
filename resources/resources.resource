*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Browser}      Chrome
${URL}          https://www.allonline.7eleven.co.th/
${Email}        0000000000    # ใส่ Email ที่ลงทะเบียน AllMember
${Password}     0000000000          # ใส่ Password ที่ลงทะเบียน AllMember
${Tel}          0000000000        # ใส่เบอร์โทรศัพท์ที่ลงทะเบียน AllMember
${StoreCode}    00903
${StoreName}    เซเว่นอีเลฟเว่น #00903
${Product}      ไมโลบาร์ ช็อกโกแลต 30 กรัม
${Quantity}     6
${TotalAmount}  ฿ 366
${Shipping}     เซเว่นอีเลฟเว่น #00903 สาขา สนามกอล์ฟทหารบก
${description_payment}  ชำระเงินด้วยบัตรเครดิต หรือ บัตรเดบิต

*** Keywords ***
เปิดเบราว์เซอร์ไปที่เว็บไซต์
    Open Browser    ${URL}    ${Browser}

ค้นหาสินค้า
    Wait Until Element Is Visible    name=q
    Input Text    name=q    ${Product}
    Click Button    xpath=//*[@id="search_id_form"]/div/span/button
    Wait Until Element Is Visible    xpath=//a[@href="/p/ไมโลบาร์-ช็อกโกแลต-30-กรัม/498305/"]
    Click Link    xpath=//a[@href="/p/ไมโลบาร์-ช็อกโกแลต-30-กรัม/498305/"]
    
เพิ่มสินค้าไปที่ตะกร้า
    Wait Until Element Is Visible    name=order_count
    Input Text    name=order_count    ${Quantity}
    Click Button    xpath=//button[contains(@class, 'btn btn-proceed btn-green gradient broad buy-now')]

เข้าสู่ระบบ
    Wait Until Element Is Visible    name=email
    Wait Until Element Is Visible    name=password
    Input Text    name=email    ${Email}
    Input Text    name=password    ${Password}
    Click Link    xpath=//a[@class='btn btn-small' and text()='เข้าสู่ระบบ']
    #*** กรณีที่ ยังไม่ได้ลงทะเบียน AllMember ตอนเข้าสู่ระบบ ***#
    Run Keyword And Ignore Error    Wait Until Element Is Visible     xpath=//button[@class='btn btn-orange' and text()='ข้าม']
    Run Keyword And Ignore Error    Click Button    xpath=//button[@class='btn btn-orange' and text()='ข้าม']

ตรวจสอบหมายเลขโทรศัพท์ AllMember
    Wait Until Element Is Visible    id=second-phone-shipping
    ${phone_number}=    Get Value    id=second-phone-shipping
    Should Be Equal As Strings    ${phone_number}    ${Tel}

เลือกสาขาด้วยรหัสร้าน
    Wait Until Element Is Visible    xpath=//div[@class='storefinder-selector store-number-tab']
    Click Element    xpath=//div[@class='storefinder-selector store-number-tab']
    Wait Until Element Is Visible    id=user-storenumber-input
    Input Text    id=user-storenumber-input    ${StoreCode}
    Wait Until Element Is Visible    id=btn-check-storenumber
    Click Button    id=btn-check-storenumber

ไปที่การชำระเงินและเลือกชำระด้วยบัตรเดบิต
    Wait Until Element Is Visible    id=continue-payment-btn
    Click Button    id=continue-payment-btn
    Wait Until Element Is Visible    xpath=//*[@id="payment-options"]/div[1]
    Element Should Contain    class=description    ${description_payment}
    Click Element    xpath=//*[@id="payment-options"]/div[1]

ตรวจสอบข้อมูลการจัดส่งและสินค้า
    Wait Until Element Is Visible    xpath=//span[@class='address-7_11_store-detail-header']
    ${store_info}=    Get Text    xpath=//span[@class='address-7_11_store-detail-header']
    Should Contain    ${store_info}    ${StoreName}
    Wait Until Element Is Visible    xpath=//td[@class='address']
    ${shipping_info}=    Get Text    xpath=//td[@class='address']
    Should Contain    ${shipping_info}    ${Shipping}
    Wait Until Page Contains    ${Product}
    Wait Until Page Contains    ${Quantity}
    ${totalAmount_info}=    Get Text    id=totalAmount
    Should Contain    ${totalAmount_info}    ${TotalAmount}
