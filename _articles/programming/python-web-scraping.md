---
category: programming
tags: python web scraping
source: https://www.dataquest.io/blog/web-scraping-tutorial-python/
author: dataquest.io
title: Python Web Scraping Using BeautifulSoup
---

In this tutorial, we’ll show you how to perform web scraping using [Python
3](https://www.python.org/downloads/release/python-350/) and the
[BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/) library. 

We’ll be scraping weather forecasts from the [National Weather
Service](http://www.weather.gov/), and then analyzing them using the
[Pandas](http://pandas.pydata.org/) library.

Before we get started, if you’re looking for more background on APIs or the
_csv_ format, you might want to check out our Dataquest courses on:
- [APIs](https://www.dataquest.io/course/apis-and-scraping) 
- [data analysis](https://www.dataquest.io/course/data-analysis-intermediate).

## The requests library


Let’s try downloading a simple sample website,
`http://dataquestio.github.io/web-scraping-pages/simple.html`. We’ll need to
first download it using the
[requests.get](https://2.python-requests.org/en/master/user/quickstart/#make-a-request)
method.

:ship: Hello World with [requests](https://2.python-requests.org/en/latest/)
```python
import requests

page = requests.get("http://dataquestio.github.io/web-scraping-pages/simple.html")

page                    # <Response [200]>
page.status_code        # 200
page.content            # display html
```

## Parsing a page with BeautifulSoup

:ship: use [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/)
library to parse this document, and extract text 
```python
from bs4 import BeautifulSoup
soup = BeautifulSoup(page.content, 'html.parser')

soup.prettify()    # print html 

list(soup.children)  # collect 

type(item) for item in list(soup.children)
    # [bs4.element.Doctype, bs4.element.NavigableString, bs4.element.Tag]
    # [0] `Doctype` object, which contains information about the type of the document.
    # [1] `NavigableString`, which represents text found in the HTML document. 
    # [2] `Tag` object, which contains other nested tags.

html = list(soup.children)[2]
```

:ship: parse children inside the `html` tag:
```python
list(html.children)
    # ['\n', 
    # <head> <title>A simple example page</title> </head>, 
    # '\n', 
    # <body> <p>Here is some simple content for this page.</p> </body>, 
    # '\n']

body = list(html.children)[3] # get <body>

list(body.children)           # <body> content 
    # ['\n', 
    # <p>Here is some simple content for this page.</p>, 
    # '\n']

p = list(body.children)[1]    # <p> content

p.get_text()  # extract text from <p>
    # 'Here is some simple content for this page.'
```

## Finding all instances of a tag at once

:ship: Use `find_all` and `find` instead of manually traversing
```python
soup.find_all('p')    # returns [] of all tags found
    # [<p>Here is some simple content for this page.</p>]

soup.find_all('p')[0].get_text()    # go directly to <p> we want
    # 'Here is some simple content for this page.'

soup.find('p')        # only get 1st instance found
    # <p>Here is some simple content for this page.</p>
```

## Finding instances by class or id

:ship: 
```python
page = requests.get("http://dataquestio.github.io/web-scraping-pages/ids_and_classes.html")

soup = BeautifulSoup(page.content, 'html.parser')

outer_text = soup.find_all(class_="outer-text")       # find all elements with class
outer_text = soup.find_all('p', class_='outer-text')  # find p with class

first_id = soup.find_all(id="first")                  # find by id
```

## Using CSS Selectors

You can also search for items using [CSS
selectors](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors).

- `p a` — finds all `a` tags inside of a `p` tag.
- `body p a` — finds all `a` tags inside of a `p` tag inside of a `body` tag.
- `html body` — finds all `body` tags inside of an `html` tag.
- `p.outer-text` — finds all `p` tags with a class of `outer-text`.
- `p#first` — finds all `p` tags with an id of `first`.
- `body p.outer-text` — finds any `p` tags with a class of `outer-text` inside of a `body` tag.

:ship: Use CSS Selector `select`
```python
soup.select("div p")
    # [<p class="inner-text first-item" id="first">
    # First paragraph.
    # </p>, <p class="inner-text">
    # Second paragraph.
    # </p>]
```

## Downloading weather data

[Extract weather information about downtown San Francisco
here](http://forecast.weather.gov/MapClick.php?lat=37.7772&lon=-122.4168).

## Exploring page structure with Chrome DevTools

The first thing we’ll need to do is inspect the page using [Chrome
Devtools](https://developer.chrome.com/devtools). 

We want the `div` tag with the id `seven-day-forecast`

If you click around on the console, and explore the div, you’ll discover that
each forecast item (like “Tonight”, “Thursday”, and “Thursday Night”) is
contained in a `div` with the class `tombstone-container`.

We now know enough to download the page and start parsing it. In the below code, we:

*   Download the web page containing the forecast.
*   Create a `BeautifulSoup` class to parse the page.
*   Find the `div` with id `seven-day-forecast`, and assign to `seven_day`
*   Inside `seven_day`, find each individual forecast item.
*   Extract and print the first forecast item.

:ship: Parse weather and print first forecast
```python
from bs4 import BeautifulSoup
soup = BeautifulSoup(page.content, 'html.parser')

page = requests.get("http://forecast.weather.gov/MapClick.php?lat=37.7772&lon=-122.4168")
soup = BeautifulSoup(page.content, 'html.parser')
seven_day = soup.find(id="seven-day-forecast")
forecast_items = seven_day.find_all(class_="tombstone-container")
tonight = forecast_items[0]
print(tonight.prettify())
```

:warning: Note the use of `class_=` vs `id=` in `find_all`

:ship: extract the name, short description, and temperature 
```python
period = tonight.find(class_="period-name").get_text()
short_desc = tonight.find(class_="short-desc").get_text()
temp = tonight.find(class_="temp").get_text()
print(period)
print(short_desc)
print(temp)
```

:ship: extract the `title` attribute from the `img` tag. 
```python
desc = img['title']
img = tonight.find("img")
print(desc)
```

:ship: Select all items within `tombstone-container`
```python
period_tags = seven_day.select(".tombstone-container .period-name")
periods = [pt.get_text() for pt in period_tags]
print(periods)

short_descs = [sd.get_text() for sd in seven_day.select(".tombstone-container .short-desc")]
print(short_descs)

temps = [t.get_text() for t in seven_day.select(".tombstone-container .temp")]
print(temps)

descs = [d["title"] for d in seven_day.select(".tombstone-container img")]
print(descs)
```

## Combining our data into a Pandas Dataframe

We can now combine the data into a [Pandas](http://pandas.pydata.org/)
DataFrame and analyze it. A DataFrame is an object that can store tabular data,
making data analysis easy. If you want to learn more about Pandas, check out
our free to start course
[here](https://www.dataquest.io/course/data-analysis-intermediate).


:ship: Set up pandas [DataFrame](http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html)
```python
import pandas as pd

weather = pd.DataFrame({
    "period": periods,
    "short_desc": short_descs,
    "temp": temps,
    "desc":descs
})
print(weather)
```

:ship: We can now do some analysis on the data using `Series.str.extract`
http://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.str.extract.html)
```python
temp_nums = weather["temp"].str.extract("(?P<temp_num>\d+)", expand=False)
weather["temp_num"] = temp_nums.astype('int')
print(temp_nums)

print(weather["temp_num"].mean())   # find the mean of all the high and low temperatures

 # We could also only select the rows that happen at night:
is_night = weather["temp"].str.contains("Low")
weather["is_night"] = is_night
print(is_night)
```

## Final Code

### scrape.py

:ship: scrape.py 
```python
import requests
from bs4 import BeautifulSoup

page = requests.get("http://dataquestio.github.io/web-scraping-pages/simple.html")

page                    # <Response [200]>
page.status_code        # 200
page.content            # display html

soup = BeautifulSoup(page.content, 'html.parser')
 #print(soup.prettify())      # print html 

 # print(list(soup.children))   # collect 
 # print([type(item) for item in list(soup.children)])
    #bs4.element.Doctype, bs4.element.NavigableString, bs4.element.Tag

html = list(soup.children)[2] # [2] contains the <html> content
 #print(html)     # print html content

list(html.children)
    # ['\n', 
    # <head> <title>A simple example page</title> </head>, 
    # '\n', 
    # <body> <p>Here is some simple content for this page.</p> </body>, 
    # '\n']

body = list(html.children)[3] # get <body>

list(body.children)           # <body> content 
    # ['\n', 
    # <p>Here is some simple content for this page.</p>, 
    # '\n']

p = list(body.children)[1]    # <p> content

p = p.get_text()  # extract text from <p>
    # 'Here is some simple content for this page.'

print("---\n<p>: " + p)

 # ---
 # Find with css selectors
 # ---

page = requests.get("http://dataquestio.github.io/web-scraping-pages/ids_and_classes.html")

soup = BeautifulSoup(page.content, 'html.parser')

outer_text = soup.find_all(class_="outer-text")       # find all elements with class
outer_text = soup.find_all('p', class_='outer-text')  # find p with class
print("\n--- outer_text: ") 
print(outer_text)

first_id = soup.find_all(id="first")                  # find by id
print("\n--- first_id: ") 
print(first_id)

div_p = soup.select("div p")        # Use CSS Selector
print("\n--- div_p: ") 
print(div_p)
```
### weather.py

:ship: weather.py 
```python
import requests
from bs4 import BeautifulSoup

page = requests.get("http://forecast.weather.gov/MapClick.php?lat=37.7772&lon=-122.4168")

soup = BeautifulSoup(page.content, 'html.parser')

seven_day = soup.find(id="seven-day-forecast")
forecast_items = seven_day.find_all(class_="tombstone-container")
tonight = forecast_items[0]

period = tonight.find(class_="period-name").get_text()
short_desc = tonight.find(class_="short-desc").get_text()
temp = tonight.find(class_="temp").get_text()
print(period)
print(short_desc)
print(temp)

img = tonight.find("img")
desc = img['title']
print(desc)

print("\n---\n")

 # :ship: Select all items within `tombstone-container`
period_tags = seven_day.select(".tombstone-container .period-name")
periods = [pt.get_text() for pt in period_tags]
print(periods)

short_descs = [sd.get_text() for sd in seven_day.select(".tombstone-container .short-desc")]
print(short_descs)

temps = [t.get_text() for t in seven_day.select(".tombstone-container .temp")]
print(temps)

descs = [d["title"] for d in seven_day.select(".tombstone-container img")]
print(descs)

print("\n---\n")

import pandas as pd

 # :ship: Set up pandas DataFrame
 # http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html
weather = pd.DataFrame({
    "period": periods,
    "short_desc": short_descs,
    "temp": temps,
    "desc":descs
})
print(weather)

print("\n---\n")

 # :ship: We can now do some analysis on the data using `Series.str.extract`
 # http://pandas.pydata.org/pandas-docs/stable/generated/pandas.Series.str.extract.html)
temp_nums = weather["temp"].str.extract("(?P<temp_num>\d+)", expand=False)
weather["temp_num"] = temp_nums.astype('int')
print(temp_nums)

print("\n---\n")

print(weather["temp_num"].mean())   # find the mean of all the high and low temperatures

print("\n---\n")

 # We could also only select the rows that happen at night:
is_night = weather["temp"].str.contains("Low")
weather["is_night"] = is_night
print(is_night)
```

## Next Steps

If you want to learn more about any of the topics covered here, check out our
interactive courses which you can start for free: [Web Scraping in
Python](https://app.dataquest.io/course/apis-and-scraping)