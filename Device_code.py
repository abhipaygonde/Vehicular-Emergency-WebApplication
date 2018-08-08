import RPi.GPIO as GPIO
import time
import re
import json
from urllib2 import urlopen
import time, serial
import pynmea2
import datetime
from subprocess import call
import os
import sys
import requests

call(['espeak -ven+m5 "Hello. Emergency system has been initialized. Please wear your seat belt. Have a safe drive." Z>/dev/null'], shell=True)

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)



GPIO.setup(18, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(24, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(17, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(22, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(27, GPIO.IN, pull_up_down=GPIO.PUD_UP)

GPIO.setup(5, GPIO.OUT)
GPIO.setup(6, GPIO.OUT)
GPIO.setup(12, GPIO.OUT)
GPIO.setup(13, GPIO.OUT)
GPIO.setup(16, GPIO.OUT)
GPIO.setup(26, GPIO.OUT)

API_ENDPOINT = "https://wegotyou.000webhostapp.com/apis/public/emergency";

url = 'http://localhost/emergency_details.php'

def car_details():
	
	response = urlopen(url)
	data = json.load(response)
	for i in data:
		Id = i['Id']
		Name = i['Owner Name']
		Owner_Address = i["Owner Address"]
		Reg = i['Vehicle Registration Number']
		Car_model = i['Car Model']
		Car_Colour =  i['Car Colour']

		print '\tID : '+Id
		print '\tName : '+Name
		print '\tEmergency Address : '+Owner_Address
		print '\tVehicle Reg. no. : '+Reg
		print '\tCar Model. : '+Car_model
		print '\tCar Colour. : '+Car_Colour +'\n'

def location():
	global lat_in_degrees
	global long_in_degrees
	global currentTime
	current = datetime.datetime.now()
	port = '/dev/ttyAMA0'
	ser = serial.Serial(port)
	ser.baudrate = 9600
	line = ser.readline()
	line2 = line.decode('latin-1')
	print(line2.find("$GPGGA") != 1)
	#print(line)

	year = current.year
	month = current.month
	day = current.day
	date = current.strftime("%A/%Y/%B/%d")
	time = current.strftime("%I:%M:%S %p")
	data = pynmea2.parse(line)

	utc = data.timestamp
	currentTime = date + " " + time
	#print "UTC = ",date, time
	print "time==>", currentTime
	

	latitude = data.lat     #extract latitude from GPGGA string
	lat = float(latitude)	#convertr string into float for calcultion
	
	decimal_value = lat/100.00
	degrees = int(decimal_value)
	mm_mmmm = (decimal_value - int(decimal_value))/0.6
	position = degrees + mm_mmmm
	position = "%.4f" %(position)
	lat_in_degrees = position

	#print "Latitude = ", lat_in_degrees

	longitude = data.lon	#extract longitude from GPGGA string
	lon = float(longitude)	#convertr string into float for calculation

	decimal_value = lon/100.00
	degrees = int(decimal_value)
	mm_mmmm = (decimal_value - int(decimal_value))/0.6
	position1 = degrees + mm_mmmm
	position1 = "%.4f" %(position1)
	long_in_degrees = position1
	#print "Longitude = ", long_in_degrees
	return ;

def send_data():
    r = requests.post(API_ENDPOINT,data)

try:

    while True:
		#Button One - Accident Emergency
		button_state = GPIO.input(17)
		if button_state == False:
			start_time = time.time()
			buttonTime = time.time() - start_time
			GPIO.output(5,GPIO.HIGH)
			call(['espeak -ven+m5 "Accident Emergency." Z>/dev/null'], shell=True)
			
			print('Emergency Type: Accident')
			print('Fetching Location')
			response = urlopen(url)
			data = json.load(response)
			for i in data:
				Id = i['Id']
				Name = i['Owner Name']
				Owner_Address = i["Owner Address"]
				Mobile = i["Mobile No"]
				Reg = i['Vehicle Registration Number']
				Car_model = i['Car Model']
				Car_Colour =  i['Car Colour']
			print '\tID : '+Id
			print '\tName : '+Name
			print '\tEmergency Address : '+Owner_Address
			print '\tMobile number : '+Mobile
			print '\tVehicle Reg. no. : '+Reg
			print '\tCar Model. : '+Car_model
			print '\tCar Colour. : '+Car_Colour +'\n'
			location()
			print "lloocccaattioonn = " , lat_in_degrees , long_in_degrees
			print "time==>", currentTime
			data = {"ownerName" : Name , "ownerAddress" : Owner_Address, "mobNo" : Mobile, "carNo" : Reg, "carModel" :Car_model, "carColor" : Car_Colour, "locLatitude" :lat_in_degrees, "locLongitude" :long_in_degrees, "emergencyType" : "Accident", "timeDate" : currentTime}
			#print (data)
			print "asdfgh==" , Name
			send_data()
			pastebin_url = r.text
			time.sleep(10)
		else:
			GPIO.output(5,GPIO.LOW)
				

		#Button Two - Medical Emergency
		button_state = GPIO.input(18)
		if button_state == False:
			GPIO.output(6,GPIO.HIGH)
			call(['espeak -ven+m5 "Medical Emergency." Z>/dev/null'], shell=True)
			print ("Emergency Type:Medical ")
			print('Fetching Location')
			response = urlopen(url)
			data = json.load(response)
			for i in data:
				Id = i['Id']
				Name = i['Owner Name']
				Owner_Address = i["Owner Address"]
				Mobile = i["Mobile No"]
				Reg = i['Vehicle Registration Number']
				Car_model = i['Car Model']
				Car_Colour =  i['Car Colour']
			print '\tID : '+Id
			print '\tName : '+Name
			print '\tEmergency Address : '+Owner_Address
			print '\tVehicle Reg. no. : '+Reg
			print '\tCar Model. : '+Car_model
			print '\tCar Colour. : '+Car_Colour +'\n'
			location()
			print "lloocccaattioonn = " , lat_in_degrees , long_in_degrees
			data = {"ownerName" : Name , "ownerAddress" : Owner_Address, "mobNo" : Mobile, "carNo" : Reg, "carModel" :Car_model, "carColor" : Car_Colour, "locLatitude" :lat_in_degrees, "locLongitude" :long_in_degrees, "emergencyType" : "Medical", "timeDate" : currentTime}
			send_data()
			pastebin_url = r.text
			time.sleep(10)
		else:
			GPIO.output(6,GPIO.LOW)
		

		#Button Three - Mechanical Emergency
		button_state = GPIO.input(27)
		if button_state == False:
			GPIO.output(12,GPIO.HIGH)
			call(['espeak -ven+m5 "Mechanical Emergency." Z>/dev/null'], shell=True)
			print ("Emergency Type: Mechanical")
			print('Fetching Location')
			response = urlopen(url)
			data = json.load(response)
			for i in data:
				Id = i['Id']
				Name = i['Owner Name']
				Owner_Address = i["Owner Address"]
				Mobile = i["Mobile No"]
				Reg = i['Vehicle Registration Number']
				Car_model = i['Car Model']
				Car_Colour =  i['Car Colour']
			print '\tID : '+Id
			print '\tName : '+Name
			print '\tEmergency Address : '+Owner_Address
			print '\tVehicle Reg. no. : '+Reg
			print '\tCar Model. : '+Car_model
			print '\tCar Colour. : '+Car_Colour +'\n'
			location()
			data = {"ownerName" : Name , "ownerAddress" : Owner_Address, "mobNo" : Mobile, "carNo" : Reg, "carModel" :Car_model, "carColor" : Car_Colour, "locLatitude" :lat_in_degrees, "locLongitude" :long_in_degrees, "emergencyType" : "Mechanical", "timeDate" : currentTime}
			print "lloocccaattioonn = " , lat_in_degrees , long_in_degrees
			send_data()
			pastebin_url = r.text
			time.sleep(10)
		else:
			GPIO.output(12,GPIO.LOW)
			

		#Button Four - Civil Emergency
		button_state = GPIO.input(22)
		if button_state == False:
			GPIO.output(13,GPIO.HIGH)
			call(['espeak -ven+m5 "Civil Emergency." Z>/dev/null'], shell=True)
			print('Emergency Type: Civil')
			print('Fetching Location')
			response = urlopen(url)
			data = json.load(response)
			for i in data:
				Id = i['Id']
				Name = i['Owner Name']
				Owner_Address = i["Owner Address"]
				Mobile = i["Mobile No"]
				Reg = i['Vehicle Registration Number']
				Car_model = i['Car Model']
				Car_Colour =  i['Car Colour']
			print '\tID : '+Id
			print '\tName : '+Name
			print '\tEmergency Address : '+Owner_Address
			print '\tVehicle Reg. no. : '+Reg
			print '\tCar Model. : '+Car_model
			print '\tCar Colour. : '+Car_Colour +'\n'
			location()
			print "lloocccaattioonn = " , lat_in_degrees , long_in_degrees
			data = {"ownerName" : Name , "ownerAddress" : Owner_Address, "mobNo" : Mobile, "carNo" : Reg, "carModel" :Car_model, "carColor" : Car_Colour, "locLatitude" :lat_in_degrees, "locLongitude" :long_in_degrees, "emergencyType" : "Civil", "timeDate" : currentTime}
			send_data()
			pastebin_url = r.text
			time.sleep(10)
		else:
			GPIO.output(13,GPIO.LOW)
			

		#Button Five - Criminal Emergency
		button_state = GPIO.input(23)
		if button_state == False:
			GPIO.output(16,GPIO.HIGH)
			call(['espeak -ven+m5 "Criminal Emergency." Z>/dev/null'], shell=True)
			print('Emergency Type: Criminal')
			print('Fetching Location')
			response = urlopen(url)
			data = json.load(response)
			for i in data:
				Id = i['Id']
				Name = i['Owner Name']
				Owner_Address = i["Owner Address"]
				Mobile = i["Mobile No"]
				Reg = i['Vehicle Registration Number']
				Car_model = i['Car Model']
				Car_Colour =  i['Car Colour']
			print '\tID : '+Id
			print '\tName : '+Name
			print '\tEmergency Address : '+Owner_Address
			print '\tVehicle Reg. no. : '+Reg
			print '\tCar Model. : '+Car_model
			print '\tCar Colour. : '+Car_Colour +'\n'
			location()
			 
			data = {"ownerName" : Name , "ownerAddress" : Owner_Address, "mobNo" : Mobile, "carNo" : Reg, "carModel" :Car_model, "carColor" : Car_Colour, "locLatitude" :lat_in_degrees, "locLongitude" :long_in_degrees, "emergencyType" : "Crimanal", "timeDate" : currentTime} 
			send_data()
			print "lloocccaattioonn = " , lat_in_degrees , long_in_degrees
			pastebin_url = r.text
			time.sleep(10)
		else:
			GPIO.output(16,GPIO.LOW)
			

		#Button Six - Abort
		button_state = GPIO.input(24)
		if button_state == False:
			GPIO.output(26,GPIO.HIGH)
			call(['espeak -ven+m5 "Device Rebooting." Z>/dev/null'], shell=True)
			#os.system("python code.py")
			time.sleep(1)
			GPIO.output(26,GPIO.LOW)
			os.system("reboot")
			print('exit')			
			break
		else:
			GPIO.output(26,GPIO.LOW)

except:
    GPIO.cleanup()