# -*- coding: utf-8 -*-
#!/bin/python

import urllib
from bs4 import BeautifulSoup
import datetime, time

def main():
	bobUrl = "http://eat.reople.com/xlos.php?date=" + str(datetime.date.today()) + "&command=get_menu"
#	bobUrl = "http://eat.reople.com/xlos.php?date=2013-10-08&command=get_menu"

	try:
		bobResponse = urllib.urlopen(bobUrl)
		bobHtmlSource = bobResponse.read()
	
		bobSource = BeautifulSoup(bobHtmlSource)
	
		for bobMenu in bobSource.find_all('b'):
			menuItem = bobMenu.font.string
			if (menuItem != None):
				print menuItem.encode('utf-8')
	except:
		print "error"

if __name__ == '__main__':
	main()

