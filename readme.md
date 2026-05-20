| [Bookmarks](/bookmarks) | [awesome-scifi](https://arafatm.com/awesome-scifi)                                 |
| :-- | :-- |
| [Emoji](/emoji)         | [coursera-machine-learning](https://arafatm.com/coursera-machine-learning)         |
| [MathJAX](/mathjax)     | [presentation-working-remotely](https://arafatm.com/presentation-working-remotely) |

## Startup
- #tax #ipo https://github.com/jlevy/og-equity-compensation

## Machine Learning & AI
- #ML/book [Machine Learning for Absolute Beginners by Oliver Theobald](/book.Machine.Learning.for.Absolute.Beginners.Oliver.Theobald/)

## System Design
- #interview #system.design [System Design](https://arafatm.com/interview.system.design/)

---

{% assign articles_by_cat = site.articles | group_by_exp: "item", "item.categories | first" %}
{% assign sorted_cats = articles_by_cat | sort: "name" %}
{% for cat in sorted_cats %}
## {{ cat.name }}
{% assign sorted_articles = cat.items | sort: "title" %}
{% for article in sorted_articles %}
- [{{ article.title | default: article.name }}]({{ article.url }})
{% endfor %}
{% endfor %}
