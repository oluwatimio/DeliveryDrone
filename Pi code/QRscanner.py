import zbarlight
import os
import sys
import PIL

print 'Finding QRcodes :)'
try:
    
    #Comment: Add a boolean so we knoe when something is scnned and correct
    #going to use this in our intergrative script to know if QR scanned
    scanned_QR_bool = false
    
    #Variable for the for loop to see if everything downloaded and is running properly 
    number = 1
    qr_code_count = len(os.listdir('qr_codes'))
    os.system('sudo fswebcam -d /dev/video'+sys.argv[1]+' -q qr_codes/qr_'+str(qr_code_count)+'.jpg')
    # print statement only used for testing purposes
    print 'Found a QR code!'
except:
    #not found, number goes back to 0
    number = 0
    print 'QR not found :('

print

# if everythings set up :)


if(number):
    # print statement only used for testing purposes
    print 'Finding image'
    
    number = open('qr_codes/qr_'+str(qr_code_count)+'.jpg','rb')
    qr = PIL.Image.open(number);
    qr.load()

    codes = zbarlight.scan_codes('qrcode',qr)
    
    # if the camera has no QR code
    if(codes==None):
        os.remove('qr_codes/qr_'+str(qr_code_count)+'.jpg')
        # print statement only used for testing purposes
        print 'No QR code found'
    else:
        #QR code has been read yay
        #Change the variable to true 
        scanned_QR_bool = true
        print 'QR code(s):'
        
        print codes
        number = open('qr_code_messages.txt','a')
        for i in range(len(codes)):
            #Actual codeis stored in the number strig variable
            #use it for the database ?
            number.write(codes[i])
            if(i!=len(codes)-1):
                number.write('^')
        number.write('~')