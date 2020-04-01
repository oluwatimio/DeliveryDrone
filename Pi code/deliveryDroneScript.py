#Make sure it has access to all the variables
#Script is based on the camera developed last semester

#Group 8 CEG4913: Delivery drone
#Gabriel Kronfeld 8781794
#Mabroor Kamal 8669942
#Malaika D’Rosario 8718097
#Timi Owoturo 8606957
#Uduak Udofia 7803807

#While nothing is scanned 
while (scanned_QR_bool != true):
    #1 check if camera has detected a code using the boolean variables

    #2 if nothing dont do anyting vehicle keeps moving

 #3 if QRcode detected
    #If boolean is set to true inside camera module
if (scanned_QR_bool):
    #3.1 Car stops

    #3.2 Claw is activated
    #3.3 Claw does what it does (picks up items)
    #3.4 Check if claw is done, if not stay idle
    #3.5 Claw is done, vehicle continues movement back to base
    #3.6 Has it reached base yet? 

    #4 At base car will stops

    #5 Claw drops items

    #6 Update database
        #Variable number stores the id and prints it on the screne in camera module 
    setDeliveredToTrue(number)

#7 reset variables for camera and claw
    #camera
    scanned_QR_bool = false
    #claw
    #car?

#8 Do again???
else:
    print("All done")

