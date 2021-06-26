import requests

headers = {'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0'} #Let's pretend to be some browser


#Start the session
ses = requests.Session()

url = 'https://www.myabandonware.com/game/terminator-3-war-of-the-machines-cnz'
resp = ses.get(url, headers = headers)

d = ses.get("https://www.myabandonware.com/download/mje-terminator-3-war-of-the-machines", stream = True, headers = headers)
d.raise_for_status()
print("Downloading file...")
filePath = "Terminator-3-War-of-the-Machines_Win_EN_ISO-Version.zip"
f = open(filePath, 'wb')
for chunk in d.iter_content(chunk_size = 8192):
	if chunk:
		f.write(chunk)
f.close()
