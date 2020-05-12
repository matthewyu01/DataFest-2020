import pandas as pd 
import requests 

def main():
    link = 'https://twitchtracker.com/statistics'
    data_list = pd.read_html(requests.get(link, headers={'User-agent': 'Mozilla/5.0'}).text)

    df = data_list[0]
    
    recent_data = df.truncate(before = 76, after = 92) # truncate dataframe to begin on Jan 2019
    recent_data.index = list(range(17)) # Modifies indices to start at 0
    
    recent_data.to_csv('twitch-adv-data.csv',  index=False)

if __name__ == '__main__':
    main()
  



