import urllib.request 
import csv

from bs4 import BeautifulSoup 

def main():
    link = "https://twitchtracker.com/statistics"
    link_request = urllib.request.Request(link, headers={'user-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36'}) 
    
    web_url = urllib.request.urlopen(link_request)
    soup = BeautifulSoup(web_url, 'lxml')
    viewers = soup.find_all('td', class_ = ["to-number", "to-monthyear"]) 

    length = len(viewers)

    with open('twitch-monthly-viewers.csv', 'w+', newline='') as csv_file:
        csv_write = csv.writer(csv_file, delimiter=',', quoting=csv.QUOTE_MINIMAL)
        csv_write.writerow(['Date' + ',' + 'Average Viewers'])
        for x in range(92, length, 4):
            csv_write.writerow([str(viewers[x].text).strip('\n'), str(viewers[x+1].text).strip('\n')])

if __name__ == "__main__":
    main()
  
