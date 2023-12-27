---
categories: programming
source: https://www.udemy.com/course/react-tutorial-and-projects-course/learn/lecture/12499178#overview
author: John Smilga
title: Udemy - React Tutorial And Projects Course
---

:octocat: https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course




# Section 1: Introduction and Setup

Understand:
* HTML
* CSS
* JS ES6
* [ ] [Coding Addict - Javascript Nuggets](https://www.youtube.com/c/CodingAddict/videos)

[GitHub - john-smilga/VS-CODE-SETUP](https://github.com/john-smilga/VS-CODE-SETUP)

# Section 2: Install create-react-app

### 10. NPM Basics

* `npm init` - creates package.json (manifest) file, list dependencies
* `npm install <package name> --save` - install package locally (default) and add to package.json
* `npm install <package name> -g` - install package GLOBALLY (access anywhere) SUDO
* `npm install <package name> --save-dev` - use it only in dev 

### 11. What is Create-react-app, Babel, Webpack

https://github.com/facebook/create-react-app 

Babel is a JS compiler that will convert ES6 to browser compatible JS

Webpack bundles your packages

### 12. Install Create-react-app

`npm install create-react-app`

`npx create-react-app my-app`

### 13. Folder Structure

* `node_modules` has all our project dependencies
* `package.json` is the manifest file
  - see the `scripts` section for npm commands available
* `public/index.html`
  - see `<div id=root>`
* `src` has our JS/React files
  - `index.js` is the entry point. Note the `<App />` injected into the root div from `index.html`
  - `App.js` is the root

### 14. Remove Boilerplate

###### :boat: Remove all the `src/*` files except for `src/index.js` and clear all the code from `index.js`

# Section 3: React Basics Tutorial

## Components

### 15. First Component

###### :boat: [My first component after deleting all the standard components created by `create-react-app`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4e05f59)

```jsx
/* +++ b/tutorial/src/index.js */
/* @@ -0,0 +1,9 @@ */
import React from 'react' // Import an ES6 module
import ReactDOM from 'react-dom'

// naming must be capitalized for React to know this is a Component
function Greeting() {
  return <h4>My first Component</h4> // required function for any React component
}

ReactDOM.render(<Greeting />, document.getElementById('root')) // this is the MAGIC!
```

### 17. First Component in Detail

###### :boat: [A react component is simply a JS function that returns JSX](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/ce71cb1)

```jsx
/* +++ b/tutorial/src/index.js */
 import React from 'react' // Import an ES6 module
 import ReactDOM from 'react-dom'
 
 // naming must be capitalized for React to know this is a Component
//-function Greeting() {
//-  return <h4>My first Component</h4> // required function for any React component
// stateless functional component always returns JSX
// function Greeting() {
//   return <h4>hello world</h4> // required function for any React component
// }

const Greeting = () => {
  return React.createElement('h1', {}, 'hello world')
 }
 
 ReactDOM.render(<Greeting />, document.getElementById('root')) // this is the MAGIC!
```

### 18. JSX Rules

* Can only **return a single parent element**/
  - Can have multiple child elements
* Avoid `div` soup. Can use `article` or `section`
  - Can create a **React.Fragment** with `<>` as the parent element in the return
* Use camelCase for html attritubes e.g. `className` instead of `<div class=...`
* close every element

### 19. Nested Components and Tools

###### :boat: [React components can be nested](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/265d0c0)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 7f86900..028e521 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -8,7 +8,17 @@ import ReactDOM from 'react-dom' */
 // }
 
 const Greeting = () => {
//- return React.createElement('h1', {}, 'hello world')
  return (
    <>
      <Person />
      <Message />
    </>
  )
}

const Person = () => <h2>John Doe</h2>
const Message = () => {
  return <p>This is my message</p>
 }
 
 ReactDOM.render(<Greeting />, document.getElementById('root')) // this is the MAGIC!
```

Using **React Developer Tools**, go tot he *Components* tab to see what has been rendered

### 20. Mini Book Project

###### :boat: [Set up mini-book project with Title, Author, Image](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1e785b7)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 78d5e8a..ba0a708 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -1,2 +1,30 @@ */
 import React from 'react' // Import an ES6 module
 import ReactDOM from 'react-dom'

function BookList() {
  return (
    <section>
      <Book />
    </section>
  )
}

const Book = () => {
  return (
    <article>
      <Title />
      <Author />
      <Image />
    </article>
  )
}
const Image = () => (
  <img
    src='https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg'
    alt='llama llama i love you'
  />
)
const Author = () => <h4>Anna Dewdney</h4>
const Title = () => <h1>Llama Llama, I Love You</h1>

ReactDOM.render(<BookList />, document.getElementById('root')) // this is the MAGIC!
```

## CSS

### 21. CSS

*Going to manually edit css for now, but will use library later*/

### 22. JSX - CSS

###### :boat: [Adding CSS styling with `@media screen` and `gap`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/82b28ec)

```css
/* diff --git a/tutorial/src/index.css b/tutorial/src/index.css */
/* index 0000000..1d0710c */
/* --- /dev/null */
/* +++ b/tutorial/src/index.css */
/* @@ -0,0 +1,38 @@ */
* {
  /* basic reset */
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
    Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  background: #d1d5ff;
  color: #222;
}

.booklist {
  width: 90vw; /* https://css-tricks.com/fun-viewport-units/ */
  max-width: 1170px;
  margin: 5rem auto;
  display: grid; /* https://css-tricks.com/snippets/css/complete-guide-grid/ */
  gap: 2rem; /* https://css-tricks.com/almanac/properties/g/gap/ */
}

@media screen and (min-width: 768px) {
  /* https://css-tricks.com/a-complete-guide-to-css-media-queries/ */
  .booklist {
    grid-template-columns: repeat(3, 1fr);
  }
}

.book {
  background: #fff;
  border-radius: 1rem;
  padding: 1rem 2rem;
}

.book h1 {
  margin-top: 0.5em;
}
```

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index ba0a708..fe8b77a 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -1,9 +1,20 @@ */
 import React from 'react' // Import an ES6 module
 import ReactDOM from 'react-dom'
 
// B'se not a React component, has to be imported using path
import './index.css'

 function BookList() {
   return (
//-    <section>
    <section className='booklist'>
      <Book />
      <Book />
      <Book />
      <Book />
      <Book />
      <Book />
      <Book />
      <Book />
       <Book />
     </section>
   )
/* @@ -11,7 +22,7 @@ function BookList() { */
 
 const Book = () => {
   return (
//-    <article>
    <article className='book'>
       <Title />
       <Author />
       <Image />
```

###### :boat: [Inline css in JSX. Note the syntax when inlining css in the jsx](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f879fc2)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index fe8b77a..fa31014 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -35,7 +35,11 @@ const Image = () => ( */
     alt='llama llama i love you'
   />
 )
//-const Author = () => <h4>Anna Dewdney</h4>
const Author = () => (
  <h4 style={{ color: '#617d98', fontsize: '0.75', marginTop: '0.25rem' }}>
    Anna Dewdney
  </h4>
)
 const Title = () => <h1>Llama Llama, I Love You</h1>
 
 ReactDOM.render(<BookList />, document.getElementById('root')) // this is the MAGIC!
```

### 23. JSX - Javascript

###### :boat: [Clean up code by removing inline css and unnecessary child components](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f837555)

###### :boat: [simple use of variables in JSX](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/db70b9b)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index ed769b4..5e77a98 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -20,11 +20,13 @@ function BookList() { */
   )
 }
 
const title = 'Llama Llama, I Love You'
const author = 'Anna Dewdney'
 const Book = () => {
   return (
     <article className='book'>
//-      <h1>Llama Llama, I Love You</h1>
//-      <h4>Anna Dewdney</h4>
      <h1>{title}</h1>
      <h4>{author}</h4>
       <img
         src='https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg'
         alt='llama llama i love you'
```

###### :boat: [We cannot have expressions in JSX, only statements](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1903fa7)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 5e77a98..bb4c8f8 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -31,6 +31,11 @@ const Book = () => { */
         src='https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg'
         alt='llama llama i love you'
       />
      {/* This won't work because we can't have expressions in JSX, only statements */}
      {/* <p>{let x = 6}</p> */}

      {/* This is a statement so it will work */}
      <p>{6 + 6}</p>
     </article>
   )
 }
```

###### :boat: [We can call JS functions in our JSX](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1d97572)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index bb4c8f8..e730a68 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -26,7 +26,7 @@ const Book = () => { */
   return (
     <article className='book'>
       <h1>{title}</h1>
//-      <h4>{author}</h4>
      <h4>{author.toUpperCase()}</h4>
       <img
         src='https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg'
         alt='llama llama i love you'
```

## Props

### 24. Props

###### :boat: [Clean up code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/71eae47)

###### :boat: [clean up code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/7d089f0)

###### :boat: [to see what gets passed](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d8407c3) Console.log(props)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 897668a..5168000 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -12,7 +12,8 @@ const img = */
 function BookList() {
   return (
     <section className='booklist'>
//-      <Book />
      {/* at this point console.log will show 'job: "developer"' on the first console.log below */}
      <Book job='developer' />
       <Book />
       <Book />
       <Book />
/* @@ -33,7 +34,6 @@ const Book = (props) => { */
       <h1>{title}</h1>
       <h4>{author}</h4>
       <img src={img} alt='llama llama i love you' />
//-      {console.log(props)}
     </article>
   )
 }
```

###### :boat: [props can be anything](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/e65644b)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 5168000..e4975f8 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -14,7 +14,7 @@ function BookList() { */
     <section className='booklist'>
       {/* at this point console.log will show 'job: "developer"' on the first console.log below */}
       <Book job='developer' />
//-      <Book />
      <Book title='randome title' number={22} />
       <Book />
       <Book />
       <Book />
```

###### :boat: [When we display the props, note that it only displays what is available. In the first book, there is no title so nothing gets displayed, but does on 2nd book](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/397133d)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index e4975f8..b6266cb 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -34,6 +34,9 @@ const Book = (props) => { */
       <h1>{title}</h1>
       <h4>{author}</h4>
       <img src={img} alt='llama llama i love you' />
      <p>{props.job}</p>
      <p>{props.title}</p>
      <p>{props.number}</p>
     </article>
   )
 }
```

###### :boat: [Passing props to our component](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/cc944d6)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index b6266cb..ab429a6 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -4,20 +4,32 @@ import ReactDOM from 'react-dom' */
 // B'se not a React component, has to be imported using path
 import './index.css'
 
//-const title = 'Llama Llama, I Love You'
//-const author = 'Anna Dewdney'
//-const img =
//-  'https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg'
const firstBook = {
  title: 'Llama Llama, I Love You',
  author: 'Anna Dewdney',
  img:
    'https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg',
}
const secondbook = {
  title: 'I Love You To The Moon And Back',
  author: 'Ameila Hepworth',
  img:
    'https://images-na.ssl-images-amazon.com/images/I/81eB%2B7%2BCkUL._AC_UL200_SR200,200_.jpg',
}
 
 function BookList() {
   return (
     <section className='booklist'>
//-      {/* at this point console.log will show 'job: "developer"' on the first console.log below */}
//-      <Book job='developer' />
//-      <Book title='randome title' number={22} />
//-      <Book />
//-      <Book />
//-      <Book />
      <Book
        title={firstBook.title}
        author={firstBook.author}
        img={firstBook.img}
      />
      <Book
        title={secondbook.title}
        author={secondbook.author}
        img={secondbook.img}
      />
       <Book />
       <Book />
       <Book />
/* @@ -31,12 +43,9 @@ const Book = (props) => { */
   console.log(props)
   return (
     <article className='book'>
//-      <h1>{title}</h1>
//-      <h4>{author}</h4>
//-      <img src={img} alt='llama llama i love you' />
//-      <p>{props.job}</p>
//-      <p>{props.title}</p>
//-      <p>{props.number}</p>
      <h1>{props.title}</h1>
      <h4>{props.author}</h4>
      <img src={props.img} alt={props.title} />
     </article>
   )
 }
```

### 25. Props - Destructuring

###### :boat: [We can assign the prop params directly into variables](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/2151172)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index ab429a6..22946b6 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -40,12 +40,12 @@ function BookList() { */
 
 /* 'props' can be renamed to anything, but it's convention */
 const Book = (props) => {
//-  console.log(props)
  const { img, title, author } = props
   return (
     <article className='book'>
//-      <h1>{props.title}</h1>
//-      <h4>{props.author}</h4>
//-      <img src={props.img} alt={props.title} />
      <h1>{title}</h1>
      <h4>{author}</h4>
      <img src={img} alt={title} />
     </article>
   )
 }
```

###### :boat: [We can instead destructure the props `object` with `{ param1, param2...}`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/94ce33f)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 22946b6..8a5a969 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -39,8 +39,7 @@ function BookList() { */
 }
 
 /* 'props' can be renamed to anything, but it's convention */
//-const Book = (props) => {
//-  const { img, title, author } = props
const Book = ({ title, author, img }) => {
   return (
     <article className='book'>
       <h1>{title}</h1>
```

### 26. Props - Children

###### WARN `children` is a keyword. 

###### :boat: [We can also pass in child elements](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/972eca1)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 8a5a969..4bd4b88 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -24,7 +24,9 @@ function BookList() { */
         title={firstBook.title}
         author={firstBook.author}
         img={firstBook.img}
//-      />
      >
        <p>Lorem ipsum dolor sit amet...</p>
      </Book>
       <Book
         title={secondbook.title}
         author={secondbook.author}
/* @@ -39,12 +41,13 @@ function BookList() { */
 }
 
 /* 'props' can be renamed to anything, but it's convention */
//-const Book = ({ title, author, img }) => {
const Book = ({ title, author, img, children }) => {
   return (
     <article className='book'>
       <h1>{title}</h1>
       <h4>{author}</h4>
       <img src={img} alt={title} />
      {children}
     </article>
   )
 }
```

If we `console.log(children)`, we see the `props` object has a special `props.children` object.

###### :memo: the order of the props after destructuring doesn't matter

`{ author, title, img}` == `{ title, img, author }`

## Lists

### 27. Simple List

###### :boat: [Trying to render `books` object results in a `Error: Objects are not valid as a React child`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4cf8f37)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 306cfda..53cf0a5 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -4,40 +4,23 @@ import ReactDOM from 'react-dom' */
 // B'se not a React component, has to be imported using path
 import './index.css'
 
//-const firstBook = {
//-  title: 'Llama Llama, I Love You',
//-  author: 'Anna Dewdney',
//-  img:
//-    'https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg',
//-}
//-const secondbook = {
//-  title: 'I Love You To The Moon And Back',
//-  author: 'Ameila Hepworth',
//-  img:
//-    'https://images-na.ssl-images-amazon.com/images/I/81eB%2B7%2BCkUL._AC_UL200_SR200,200_.jpg',
//-}
const books = [
  {
    title: 'Llama Llama, I Love You',
    author: 'Anna Dewdney',
    img:
      'https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg',
  },
  {
    title: 'I Love You To The Moon And Back',
    author: 'Ameila Hepworth',
    img:
      'https://images-na.ssl-images-amazon.com/images/I/81eB%2B7%2BCkUL._AC_UL200_SR200,200_.jpg',
  },
]
 
 function BookList() {
//-  return (
//-    <section className='booklist'>
//-      <Book
//-        title={firstBook.title}
//-        author={firstBook.author}
//-        img={firstBook.img}
//-      >
//-        <p>Lorem ipsum dolor sit amet...</p>
//-      </Book>
//-      <Book
//-        title={secondbook.title}
//-        author={secondbook.author}
//-        img={secondbook.img}
//-      />
//-      <Book />
//-      <Book />
//-      <Book />
//-      <Book />
//-    </section>
//-  )
  return <section className='booklist'>{books}</section>
 }
 
 /* 'props' can be renamed to anything, but it's convention */
```

###### :boat: [We can render an array but not an object](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/924c470)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 53cf0a5..f3a6644 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -19,8 +19,9 @@ const books = [ */
   },
 ]
 
const names = ['john', 'peter', 'susan']
 function BookList() {
//-  return <section className='booklist'>{books}</section>
  return <section className='booklist'>{names}</section>
 }
 
 /* 'props' can be renamed to anything, but it's convention */
```

###### :boat: [We can `map()` an array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6773647)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index f3a6644..6717465 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -20,6 +20,9 @@ const books = [ */
 ]
 
 const names = ['john', 'peter', 'susan']
const newName = names.map((name) => {
  console.log(name)
})
 function BookList() {
   return <section className='booklist'>{names}</section>
 }
```

###### :boat: [ We can render the `map()`ed array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/95f4699)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 6717465..11c5a18 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -21,10 +21,10 @@ const books = [ */
 
 const names = ['john', 'peter', 'susan']
 const newName = names.map((name) => {
//-  console.log(name)
  return <h1>{name}</h1>
 })
 function BookList() {
//-  return <section className='booklist'>{names}</section>
  return <section className='booklist'>{newName}</section>
 }
 
 /* 'props' can be renamed to anything, but it's convention */
```

### 28. Proper List

###### :boat: [Clean up code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/66caf1f)

###### :boat: [Experiment with `map()`ing our Books array. Note that we get 2 "hello"s since we have 2 elements in the array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9c11352)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 53cf0a5..d1365f4 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -20,7 +20,13 @@ const books = [ */
 ]
 
 function BookList() {
//-  return <section className='booklist'>{books}</section>
  return (
    <section className='booklist'>
      {books.map((book) => {
        return 'hello'
      })}
    </section>
  )
 }
 
 /* 'props' can be renamed to anything, but it's convention */
```

###### :boat: [Render our Books individually from the list](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f512387)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index d1365f4..a530787 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -23,7 +23,8 @@ function BookList() { */
   return (
     <section className='booklist'>
       {books.map((book) => {
//-        return 'hello'
        const { img, title, author } = book
        return <Book img={img} title={title} author={author} />
       })}
     </section>
   )
```

###### :boat: [Pass a book prop into our `Book` component](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9b6a585)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index a530787..98008d7 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -24,20 +24,21 @@ function BookList() { */
     <section className='booklist'>
       {books.map((book) => {
         const { img, title, author } = book
//-        return <Book img={img} title={title} author={author} />
        return <Book book={book} />
       })}
     </section>
   )
 }
 
 /* 'props' can be renamed to anything, but it's convention */
//-const Book = ({ author, title, img, children }) => {
const Book = (props) => {
  console.log(props)
  console.log(props.book)
   return (
     <article className='book'>
//-      <h1>{title}</h1>
//-      <h4>{author}</h4>
//-      <img src={img} alt={title} />
//-      {children}
      <h1>{props.book.title}</h1>
      <h4>{props.book.author}</h4>
      <img src={props.book.img} alt={props.book.title} />
     </article>
   )
 }
```

###### :boat: [Same as above but cleaner to read](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9c7d442)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 98008d7..4cf3136 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -33,12 +33,12 @@ function BookList() { */
 /* 'props' can be renamed to anything, but it's convention */
 const Book = (props) => {
   console.log(props)
//-  console.log(props.book)
  const { img, title, author } = props.book
   return (
     <article className='book'>
//-      <h1>{props.book.title}</h1>
//-      <h4>{props.book.author}</h4>
//-      <img src={props.book.img} alt={props.book.title} />
      <h1>{title}</h1>
      <h4>{author}</h4>
      <img src={img} alt={title} />
     </article>
   )
 }
```

###### :boat: [We dont need to break down book inside the map](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/fccba24)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 4cf3136..6907974 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -23,7 +23,6 @@ function BookList() { */
   return (
     <section className='booklist'>
       {books.map((book) => {
//-        const { img, title, author } = book
         return <Book book={book} />
       })}
     </section>
```

### 29. Key Prop and Spread Operator

###### :imp: At this point I'm getting a `Warning: Each child in a list should have a unique "key" prop`

###### :boat: [Manually add an id](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4341b5c)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 6907974..1b272b9 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -6,12 +6,14 @@ import './index.css' */
 
 const books = [
   {
    id: 1,
     title: 'Llama Llama, I Love You',
     author: 'Anna Dewdney',
     img:
       'https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg',
   },
   {
    id: 2,
     title: 'I Love You To The Moon And Back',
     author: 'Ameila Hepworth',
     img:
```

###### :boat: [We can simply use the array index as the key. **WARN** This is not suggested](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/a40e475)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 1b272b9..60c3c84 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -24,8 +24,8 @@ const books = [ */
 function BookList() {
   return (
     <section className='booklist'>
//-      {books.map((book) => {
//-        return <Book book={book} />
      {books.map((book, index) => {
        return <Book key={index} book={book} />
       })}
     </section>
   )
```

###### :boat: [Use our manually added `id` instead](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/282df2b)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 60c3c84..c36eae3 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -25,7 +25,7 @@ function BookList() { */
   return (
     <section className='booklist'>
       {books.map((book, index) => {
//-        return <Book key={index} book={book} />
        return <Book key={book.id} book={book} />
       })}
     </section>
   )
```

###### :boat: [Use **spread operator** to pass the prop](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/087fe3a)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index c36eae3..2374155 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -25,7 +25,7 @@ function BookList() { */
   return (
     <section className='booklist'>
       {books.map((book, index) => {
//-        return <Book key={book.id} book={book} />
        return <Book key={book.id} {...book} />
       })}
     </section>
   )
/* @@ -34,7 +34,7 @@ function BookList() { */
 /* 'props' can be renamed to anything, but it's convention */
 const Book = (props) => {
   console.log(props)
//-  const { img, title, author } = props.book
  const { img, title, author } = props
   return (
     <article className='book'>
       <h1>{title}</h1>
```

###### :boat: [Another way to use the spread prop](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f646258)

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 2374155..30f4b7e 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -32,9 +32,9 @@ function BookList() { */
 }
 
 /* 'props' can be renamed to anything, but it's convention */
//-const Book = (props) => {
//-  console.log(props)
//-  const { img, title, author } = props
const Book = ({ img, title, author }) => {
  // console.log(props)
  // const { img, title, author } = props
   return (
     <article className='book'>
       <h1>{title}</h1>
```

## Events, Import, Export

### 30. Event Basics

###### :boat: [Clean code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5f237d2)

List of supported events in React https://reactjs.org/docs/events.html#supported-events

###### :boat: [Example `onClick` handler as a reference function](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/7945d5b)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index c6e18ca..da2bf1b 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -33,11 +33,21 @@ function BookList() { */
 
 /* 'props' can be renamed to anything, but it's convention */
 const Book = ({ img, title, author }) => {
  // attribute, eventHandler
  // onClick, onMouseOver

  const clickHandler = () => {
    alert('hello world')
  }

   return (
     <article className='book'>
       <h1>{title}</h1>
       <h4>{author}</h4>
       <img src={img} alt={title} />
      <button type='button' onClick={clickHandler}>
        reference example
      </button>
     </article>
   )
 }
```

###### :boat: [Example inline `onClick` handler](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/bc5dea9)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index da2bf1b..e37a213 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -42,7 +42,7 @@ const Book = ({ img, title, author }) => { */
 
   return (
     <article className='book'>
//-      <h1>{title}</h1>
      <h1 onClick={() => console.log(title)}>{title}</h1>
       <h4>{author}</h4>
       <img src={img} alt={title} />
       <button type='button' onClick={clickHandler}>
```

###### :boat: [Example complex `onClick` handler with an arg. **WARN** In this example the handler will be called on render because its not passed as a fn handler](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/8371950)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index e37a213..73cdca9 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -40,6 +40,10 @@ const Book = ({ img, title, author }) => { */
     alert('hello world')
   }
 
  const complexExample = (author) => {
    console.log(author)
  }

   return (
     <article className='book'>
       <h1 onClick={() => console.log(title)}>{title}</h1>
/* @@ -48,6 +52,9 @@ const Book = ({ img, title, author }) => { */
       <button type='button' onClick={clickHandler}>
         reference example
       </button>
      <button type='button' onClick={complexExample(author)}>
        more complex example
      </button>
     </article>
   )
 }
```

###### :boat: [How to fix last handler passing a fn](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/90e377d)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 73cdca9..ccb23c6 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -52,7 +52,7 @@ const Book = ({ img, title, author }) => { */
       <button type='button' onClick={clickHandler}>
         reference example
       </button>
//-      <button type='button' onClick={complexExample(author)}>
      <button type='button' onClick={() => complexExample(author)}>
         more complex example
       </button>
     </article>
```

###### :boat: [`onClick` handler with `event`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f619553)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index ccb23c6..6e37405 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -36,8 +36,10 @@ const Book = ({ img, title, author }) => { */
   // attribute, eventHandler
   // onClick, onMouseOver
 
//-  const clickHandler = () => {
//-    alert('hello world')
  const clickHandler = (e) => {
    console.log(e)
    console.log(e.target)
    console.log('clickHandler')
   }
 
   const complexExample = (author) => {
```

###### :boat: [Example `onMouseOver` event handler](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/608cd9b)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 6e37405..6f14847 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -47,7 +47,7 @@ const Book = ({ img, title, author }) => { */
   }
 
   return (
//-    <article className='book'>
    <article className='book' onMouseOver={() => console.log(title)}>
       <h1 onClick={() => console.log(title)}>{title}</h1>
       <h4>{author}</h4>
       <img src={img} alt={title} />
```

### 31. Import and Export Statements

###### :boat: [Named export/import](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/216d845)
```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index 6f14847..fb0e1de 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -4,22 +4,7 @@ import ReactDOM from 'react-dom' */
 // B'se not a React component, has to be imported using path
 import './index.css'
 
//-const books = [
//-  {
//-    id: 1,
//-    title: 'Llama Llama, I Love You',
//-    author: 'Anna Dewdney',
//-    img:
//-      'https://images-na.ssl-images-amazon.com/images/I/918sHoEOD8L._AC_UL200_SR200,200_.jpg',
//-  },
//-  {
//-    id: 2,
//-    title: 'I Love You To The Moon And Back',
//-    author: 'Ameila Hepworth',
//-    img:
//-      'https://images-na.ssl-images-amazon.com/images/I/81eB%2B7%2BCkUL._AC_UL200_SR200,200_.jpg',
//-  },
//-]
import { books } from './books' // `books` has to exactly match the **Named Export** `export const books`
 
 function BookList() {
   return (
```

###### :boat: [Default export/import](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/06e4d19)
```jsx
/* diff --git a/tutorial/src/book.js b/tutorial/src/book.js */
/* index e69de29..11288be 100644 */
/* --- a/tutorial/src/book.js */
/* +++ b/tutorial/src/book.js */
/* @@ -0,0 +1,33 @@ */
import React from 'react'

/* 'props' can be renamed to anything, but it's convention */
const Book = ({ img, title, author }) => {
  // attribute, eventHandler
  // onClick, onMouseOver

  const clickHandler = (e) => {
    console.log(e)
    console.log(e.target)
    console.log('clickHandler')
  }

  const complexExample = (author) => {
    console.log(author)
  }

  return (
    <article className='book' onMouseOver={() => console.log(title)}>
      <h1 onClick={() => console.log(title)}>{title}</h1>
      <h4>{author}</h4>
      <img src={img} alt={title} />
      <button type='button' onClick={clickHandler}>
        reference example
      </button>
      <button type='button' onClick={() => complexExample(author)}>
        more complex example
      </button>
    </article>
  )
}

export default Book // You can only have 1 default export per file
```

```jsx
/* diff --git a/tutorial/src/index.js b/tutorial/src/index.js */
/* index fb0e1de..e6a8782 100644 */
/* --- a/tutorial/src/index.js */
/* +++ b/tutorial/src/index.js */
/* @@ -5,6 +5,7 @@ import ReactDOM from 'react-dom' */
 import './index.css'
 
 import { books } from './books' // `books` has to exactly match the **Named Export** `export const books`
import Book from './book' // default import
 
 function BookList() {
   return (
/* @@ -16,33 +17,4 @@ function BookList() { */
   )
 }
 
//-/* 'props' can be renamed to anything, but it's convention */
//-const Book = ({ img, title, author }) => {
//-  // attribute, eventHandler
//-  // onClick, onMouseOver
//-
//-  const clickHandler = (e) => {
//-    console.log(e)
//-    console.log(e.target)
//-    console.log('clickHandler')
//-  }
//-
//-  const complexExample = (author) => {
//-    console.log(author)
//-  }
//-
//-  return (
//-    <article className='book' onMouseOver={() => console.log(title)}>
//-      <h1 onClick={() => console.log(title)}>{title}</h1>
//-      <h4>{author}</h4>
//-      <img src={img} alt={title} />
//-      <button type='button' onClick={clickHandler}>
//-        reference example
//-      </button>
//-      <button type='button' onClick={() => complexExample(author)}>
//-        more complex example
//-      </button>
//-    </article>
//-  )
//-}
 ReactDOM.render(<BookList />, document.getElementById('root')) // this is the MAGIC!
```

## Hosting

### 32. Free Hosting

Going to use https://www.netlify.com to deploy (using free starter pack)
* for now we won't use CD

To deploy
* `npm run build` will create deployable package in `/build`
* drag&drop the `/build` folder onto the netlify page
* netlify will deploy and give you a link

My deployed code https://lucid-mclean-c4263f.netlify.app/

# Section 4: React Hooks and Advanced Topics

## Intro

https://reactjs.org/docs/hooks-intro.html

Will learn:
* useState
* useEffect
* Conditional Rendering
* Forms
* useRef
* useReducer
* Prop Drilling
* Context API / useContext

If we just learn the 1st two (`useState`, `useEffect`), it gets us most of the way there

### 34. Starter Project

Copy starter code from https://github.com/john-smilga/react-advanced-2020

### 35. Install Starter

###### :boat: [starter code in `/react-advanced-2020-master/`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/820a254)

### 36. Starter Overview

Used `create-react-app` to create the starter code
* includes all the necessary boilerplate js & css
* there are `final` folders with solutions if needed
* `src/index.js` renders `App.js`
* `tutorial` folder is organized by chapter e.g. `1-useState`
  - `setup` has the starting code to practice
  - `final` has the completed solution to compare

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/2fca652)

## useState

### 37. useState - Simple Use Case

###### :boat: [Set up 1-error-example](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/43be235)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index e2d9703..a5dce15 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,7 +1,12 @@ */
 import React from 'react'
import Setup from './tutorial/1-useState/setup/1-error-example'
 
 function App() {
//-  return <div className='container'></div>
  return (
    <div className='container'>
      <Setup />
    </div>
  )
 }
 
 export default App
```

###### :boat: [Simple `onClick` handler. Note that even though were changing `title` (shows up](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/16759b4)
correctly in console.log), the component isnt **rerendered**/
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/1-error-example.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/1-error-example.js */
/* index a277e62..e00b9ea 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/1-error-example.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/1-error-example.js */
/* @@ -1,7 +1,19 @@ */
//-import React from 'react';
import React from 'react'
 
 const ErrorExample = () => {
//-  return <h2>useState error example</h2>;
//-};
  let title = 'random title'
  const handleClick = () => {
    title = 'Hello People'
    console.log(title)
  }
  return (
    <>
      <h2>{title}</h2>
      <button type='button' className='btn' onClick={handleClick}>
        change title
      </button>
    </>
  )
}
 
//-export default ErrorExample;
export default ErrorExample
```

### 38. useState - Basics

###### :boat: [Basic `useState`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/356267d)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index a5dce15..1e5790b 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/1-useState/setup/1-error-example'
import Setup from './tutorial/1-useState/setup/2-useState-basics'
 
 function App() {
   return (

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js */
/* index fcf1c87..3704292 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js */
/* @@ -1,7 +1,15 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 
 const UseStateBasics = () => {
//-  return <h2>useState basic example</h2>;
//-};
  //console.log(useState('hello world'))
 
//-export default UseStateBasics;
  // useState()[0] is the value we want to update
  // useState()[1] is the funciton that will update the value
  const value = useState(1)[0]
  const handler = useState(1)[1]
  console.log(value, handler)

  return <h2>useState basic example</h2>
}

export default UseStateBasics
```

###### :boat: [`useState` with event handler using `set...`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/44c6950)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js */
/* index 3704292..85267d6 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/2-useState-basics.js */
/* @@ -5,11 +5,25 @@ const UseStateBasics = () => { */
 
   // useState()[0] is the value we want to update
   // useState()[1] is the funciton that will update the value
//-  const value = useState(1)[0]
//-  const handler = useState(1)[1]
//-  console.log(value, handler)
  // const value = useState(1)[0]
  // const handler = useState(1)[1]
  // console.log(value, handler)
 
//-  return <h2>useState basic example</h2>
  // Above is the same as
  const [text, setText] = useState('hello state')

  const handleClick = () => {
    setText('new random state')
  }

  return (
    <>
      <h2>{text}</h2>
      <button className='btn' onClick={handleClick}>
        change Title
      </button>
    </>
  )
 }
 
 export default UseStateBasics
```

###### :boat: [This is cool `text-transform: capitalize`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4e0c2d8)
```css
/* diff --git a/react-advanced-2020-master/src/index.css b/react-advanced-2020-master/src/index.css */
/* index 04647e2..abcbb8b 100644 */
/* --- a/react-advanced-2020-master/src/index.css */
/* +++ b/react-advanced-2020-master/src/index.css */
/* @@ -86,7 +86,7 @@ h2, */
 h3,
 h4 {
   letter-spacing: var(--spacing);
//-  text-transform: capitalize;
  text-transform: capitalize; /* this is cool */
   line-height: 1.25;
   margin-bottom: 0.75rem;
 }
```

### 39. General Rules of Hooks

Rules:
* Hooks always start with `use`
* component with hook must CamelCased 
  - `const useStateBasics` wil throw an error.
* hook must be invoked inside the function/component body
* cannot call the hook conditionally

### 40. useState - Array Example

###### :boat: [ Set up `useState([])` for an array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/087f819)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index 1e5790b..e5cbeed 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/1-useState/setup/2-useState-basics'
import Setup from './tutorial/1-useState/setup/3-useState-array'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* index ff6061c..0a3df0d 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* @@ -1,8 +1,9 @@ */
//-import React from 'react';
//-import { data } from '../../../data';
import React from 'react'
import { data } from '../../../data'
 
 const UseStateArray = () => {
//-  return <h2>useState array example</h2>;
//-};
  const [people, setPeople] = React.useState([])
  return <h2>useState array example</h2>
}
 
//-export default UseStateArray;
export default UseStateArray
```

###### :boat: [ `people.map(...)` to iterate over the array and display](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/efa5b43)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* index 0a3df0d..74bebe9 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* @@ -2,8 +2,19 @@ import React from 'react' */
 import { data } from '../../../data'
 
 const UseStateArray = () => {
//-  const [people, setPeople] = React.useState([])
//-  return <h2>useState array example</h2>
  const [people, setPeople] = React.useState(data)
  return (
    <>
      {people.map((person) => {
        const { id, name } = person
        return (
          <div key={id} className='item'>
            <h4>{name}</h4>
          </div>
        )
      })}
    </>
  )
 }
 
 export default UseStateArray
```

###### :boat: [use `setPeople` to clear our array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/3c829c8)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* index 74bebe9..dae6b2c 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* @@ -13,6 +13,9 @@ const UseStateArray = () => { */
           </div>
         )
       })}
      <button className='btn' onClick={() => setPeople([])}>
        clear items
      </button>
     </>
   )
 }
```

###### :boat: [ use `people.filter(...)` to remove individual `person` from `people` array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1133890)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* index dae6b2c..e7b6402 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/3-useState-array.js */
/* @@ -3,6 +3,12 @@ import { data } from '../../../data' */
 
 const UseStateArray = () => {
   const [people, setPeople] = React.useState(data)

  const removeItem = (id) => {
    let newPeople = people.filter((person) => person.id !== id)
    setPeople(newPeople)
  }

   return (
     <>
       {people.map((person) => {
/* @@ -10,9 +16,11 @@ const UseStateArray = () => { */
         return (
           <div key={id} className='item'>
             <h4>{name}</h4>
            <button onClick={() => removeItem(id)}>remove</button>
           </div>
         )
       })}
      {/* we need to call it as an array fn */}
       <button className='btn' onClick={() => setPeople([])}>
         clear items
       </button>
```

###### :memo: we use `() => setPeople` so it only runs when invoked on the event.  If we just do `setPeople`, it will run on every render

### 41. useState - Object Example

###### :boat: [`useState` with an object](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/0763ec9)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index e5cbeed..7850a30 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/1-useState/setup/3-useState-array'
import Setup from './tutorial/1-useState/setup/4-useState-object'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* index 932604d..c9cec6e 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* @@ -1,7 +1,20 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 
 const UseStateObject = () => {
//-  return <h2>useState object example</h2>;
//-};
  const [person, setPerson] = useState({
    name: 'Peter',
    age: 24,
    message: 'random message',
  })
  console.log(person)
 
//-export default UseStateObject;
  return (
    <>
      <h3>{person.name}</h3>
      <h3>{person.age}</h3>
      <h3>{person.message}</h3>
    </>
  )
}

export default UseStateObject
```

###### :boat: [We can overwrite `State` with anything, even different type](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/be770fb)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* index c9cec6e..b1937e8 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* @@ -8,11 +8,17 @@ const UseStateObject = () => { */
   })
   console.log(person)
 
  const changeMessage = () => {
    setPerson('hello world')
  }
   return (
     <>
       <h3>{person.name}</h3>
       <h3>{person.age}</h3>
       <h3>{person.message}</h3>
      <button className='btn' onClick={changeMessage}>
        Change Message
      </button>
     </>
   )
 }
```

###### :boat: [Use the **Spread Operator** to overwrite a single attribute of an object with `setState`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/e441279)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* index b1937e8..0415191 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/4-useState-object.js */
/* @@ -9,7 +9,7 @@ const UseStateObject = () => { */
   console.log(person)
 
   const changeMessage = () => {
//-    setPerson('hello world')
    setPerson({ ...person, message: 'hello world' })
   }
   return (
     <>
```

### 42. useState - Multiple State Values

In the previous example we could have created separate `state` for each attribute but this can get verbose.

e.g. 

```jsx
const [name, setName] = useState('peter')
const [age, setAge] = useState(42)
const [message, setMessage] = useState('random message')
```

### 43. Simple Counter

###### :boat: [Simple `setState` example with counter and examples of both inline as well as fn ref for event handling](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/ad882ad)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index 7850a30..d666594 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/1-useState/setup/4-useState-object'
import Setup from './tutorial/1-useState/setup/5-useState-counter'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* index fb6ede7..1a9fc9d 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* @@ -1,7 +1,29 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 
 const UseStateCounter = () => {
//-  return <h2>useState counter example</h2>;
//-};
  const [value, setValue] = useState(0)
 
//-export default UseStateCounter;
  // using a handler instead of inline like we did for increase and decrease
  const reset = () => {
    setValue(0)
  }
  return (
    <>
      <section style={{ margin: '4rem 0' }}>
        <h2>regular counter</h2>
        <h1>{value}</h1>
        <button className='btn' onClick={() => setValue(value + 1)}>
          increase
        </button>
        <button className='btn' onClick={() => setValue(value - 1)}>
          decrease
        </button>
        <button className='btn' onClick={reset}>
          reset
        </button>
      </section>
    </>
  )
}

export default UseStateCounter
```

### 44. Functional Update Form

###### :boat: [Event handlers are called asynchrounously. In this case if I click on the](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f142766)
button multiple times within the 2sec timeout, it only will update once
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* index 1a9fc9d..032c578 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* @@ -7,19 +7,20 @@ const UseStateCounter = () => { */
   const reset = () => {
     setValue(0)
   }

  const complexIncrease = () => {
    setTimeout(() => {
      setValue(value + 1)
    }, 2000)
  }

   return (
     <>
       <section style={{ margin: '4rem 0' }}>
//-        <h2>regular counter</h2>
        <h2>more complex counter</h2>
         <h1>{value}</h1>
//-        <button className='btn' onClick={() => setValue(value + 1)}>
//-          increase
//-        </button>
//-        <button className='btn' onClick={() => setValue(value - 1)}>
//-          decrease
//-        </button>
//-        <button className='btn' onClick={reset}>
//-          reset
        <button className='btn' onClick={complexIncrease}>
          increase later
         </button>
       </section>
     </>
```

###### :boat: [Calling a function with `prevState` actually updates the state](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/77f3a26)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js b/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* index 032c578..615076c 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* +++ b/react-advanced-2020-master/src/tutorial/1-useState/setup/5-useState-counter.js */
/* @@ -10,7 +10,9 @@ const UseStateCounter = () => { */
 
   const complexIncrease = () => {
     setTimeout(() => {
//-      setValue(value + 1)
      setValue((prevState) => {
        return prevState + 1
      })
     }, 2000)
   }
```

###### :memo: Make sure you return **something** when using the **functional approach** to `setValue`

### 45. Matching Project

[Practice with Birthday Reminder Project](#88-Birthday-Reminder---Intro)

## useEffect

### 46. useEffect - Basics

###### :memo: `useEffect` is used for functionality that is "outside" the component

###### :boat: [Basic `useEffect`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/01744d7)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index d666594..83b9e82 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/1-useState/setup/5-useState-counter'
import Setup from './tutorial/2-useEffect/setup/1-useEffect-basics'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* index 097880e..2fee26c 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* @@ -1,9 +1,14 @@ */
//-import React, { useState, useEffect } from 'react';
//-// by default runs after every re-render
import React, { useState, useEffect } from 'react' // import `useEffect`

 // cleanup function
 // second parameter
 const UseEffectBasics = () => {
//-  return <h2>useEffect Basics</h2>;
//-};
  // called after every re-render
  useEffect(() => {
    console.log('call useEffect')
  })
  console.log('render component')
  return <h2>useEffect Basics</h2>
}
 
//-export default UseEffectBasics;
export default UseEffectBasics
```

###### :boat: [Show how `useEffect` is run on every render](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/053e332)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* index 2fee26c..a1c1732 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* @@ -3,12 +3,23 @@ import React, { useState, useEffect } from 'react' // import `useEffect` */
 // cleanup function
 // second parameter
 const UseEffectBasics = () => {
  const [value, setValue] = useState(0)

   // called after every re-render
   useEffect(() => {
     console.log('call useEffect')
    document.title = `New Messages(${value})`
   })
   console.log('render component')
//-  return <h2>useEffect Basics</h2>
  return (
    <>
      <h1>{value}</h1>
      {/* `oncClick` triggers re-render hence `useEffect` */}
      <button className='btn' onClick={() => setValue(value + 1)}>
        click me
      </button>
    </>
  )
 }
 
 export default UseEffectBasics
```

### 47. useEffect - Conditional

###### :boat: [**WARN** Hooks cannot be inside a conditional. This will cause an error](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1672f68)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* index a1c1732..fcecb5d 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* @@ -5,11 +5,13 @@ import React, { useState, useEffect } from 'react' // import `useEffect` */
 const UseEffectBasics = () => {
   const [value, setValue] = useState(0)
 
//-  // called after every re-render
//-  useEffect(() => {
//-    console.log('call useEffect')
//-    document.title = `New Messages(${value})`
//-  })
  if (value > 0) {
    // called after every re-render
    useEffect(() => {
      console.log('call useEffect')
      document.title = `New Messages(${value})`
    })
  }
   console.log('render component')
   return (
     <>
```

###### :boat: [We can have our conditional inside the `useEffect` hook](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/a223393)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* index fcecb5d..07c177e 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* @@ -5,13 +5,11 @@ import React, { useState, useEffect } from 'react' // import `useEffect` */
 const UseEffectBasics = () => {
   const [value, setValue] = useState(0)
 
//-  if (value > 0) {
//-    // called after every re-render
//-    useEffect(() => {
//-      console.log('call useEffect')
//-      document.title = `New Messages(${value})`
//-    })
//-  }
  // called after every re-render
  useEffect(() => {
    console.log('call useEffect')
    if (value > 1) document.title = `New Messages(${value})`
  })
   console.log('render component')
   return (
     <>
```

### 48. useEffect - Dependency List

###### :boat: [Example of using 2nd param to `useEffect`. In this case `[]` implies it will only be called on initial render](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/22dc4a7)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* index 07c177e..07489a4 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* @@ -9,7 +9,8 @@ const UseEffectBasics = () => { */
   useEffect(() => {
     console.log('call useEffect')
     if (value > 1) document.title = `New Messages(${value})`
//-  })
  }, []) // only runs on initial render

   console.log('render component')
   return (
     <>
```

###### :boat: [We can have multiple `useEffect`. In this case the 2nd one only runs on initial render](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/e144357)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* index 07489a4..0d21f74 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/1-useEffect-basics.js */
/* @@ -9,6 +9,10 @@ const UseEffectBasics = () => { */
   useEffect(() => {
     console.log('call useEffect')
     if (value > 1) document.title = `New Messages(${value})`
  }, [value]) // runs when `value` is updated

  useEffect(() => {
    console.log('hello world')
   }, []) // only runs on initial render
 
   console.log('render component')
```

### 49. useEffect - Cleanup Function

###### :boat: [Setup simple `useEffect` example to show how cleanup works](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/eee184b)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index 83b9e82..15df405 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/2-useEffect/setup/1-useEffect-basics'
import Setup from './tutorial/2-useEffect/setup/2-useEffect-cleanup'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js */
/* index c0e5272..d6c0309 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js */
/* @@ -1,10 +1,26 @@ */
//-import React, { useState, useEffect } from 'react';
import React, { useState, useEffect } from 'react'
 
 // cleanup function
 // second argument
 
 const UseEffectCleanup = () => {
//-  return <h2>useEffect cleanup</h2>;
//-};
  const [size, setSize] = useState(window.innerWidth)
  console.log(size)
 
//-export default UseEffectCleanup;
  const checksize = () => {
    setSize(window.innerWidth)
  }

  useEffect(() => {
    window.addEventListener('resize', checksize)
  })

  return (
    <>
      <h1>Window</h1>
      <h2>{size} px</h2>
    </>
  )
}

export default UseEffectCleanup
```

###### :memo: Every time the component is re-rendered, a new `resize` event listener is created. This will eventually lead to a memory leak. To check, look in `Developer Tools -> Elements` and on the right, select the `Event Listeners` tab to see a new one is created every time

###### :boat: [a `return` inside the useEffect is used as a cleanup function](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/90db17b)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js */
/* index d6c0309..06f7e19 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/2-useEffect-cleanup.js */
/* @@ -12,9 +12,17 @@ const UseEffectCleanup = () => { */
   }
 
   useEffect(() => {
    console.log('useEffect')
     window.addEventListener('resize', checksize)

    // a `return` in useEffect is a cleanup function
    return () => {
      console.log('cleanup')
      window.removeEventListener('resize', checksize)
    }
   })
 
  console.log('render')
   return (
     <>
       <h1>Window</h1>
```

### 50. useEffect - Fetch Data

###### :boat: [Set up `async` fetch function from github api](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f7622a1)
```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index 15df405..ce47c11 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/2-useEffect/setup/2-useEffect-cleanup'
import Setup from './tutorial/2-useEffect/setup/3-useEffect-fetch-data'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* index bee3068..abc5bd6 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* @@ -1,9 +1,26 @@ */
//-import React, { useState, useEffect } from 'react';
import React, { useState, useEffect } from 'react'
 
//-const url = 'https://api.github.com/users';
const url = 'https://api.github.com/users'
 
 const UseEffectFetchData = () => {
//-  return <h2>fetch data</h2>;
//-};
  const [users, setusers] = useState([])
 
//-export default UseEffectFetchData;
  const getUsers = async () => {
    //
    const response = await fetch(url)
    const users = await response.json()
    console.log(users)
  }

  useEffect(() => {
    getUsers()
  }, [])

  return (
    <>
      <h3>github users</h3>
    </>
  )
}

export default UseEffectFetchData
```

###### :boat: [**WARN** Avoid the infinite loop](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/86c1f2f)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* index abc5bd6..351aec0 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* @@ -9,12 +9,16 @@ const UseEffectFetchData = () => { */
     //
     const response = await fetch(url)
     const users = await response.json()

    // Note this next line will cause an infinite loop since `useEffect` will be
    // triggered every time `setusers` is called
    // setUsers(users)
     console.log(users)
   }
 
   useEffect(() => {
     getUsers()
//-  }, [])
  })
 
   return (
     <>
```

###### :boat: [make sure we only call `getUsers` on initial render](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/eb7249d)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* index 351aec0..827180f 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* @@ -10,15 +10,13 @@ const UseEffectFetchData = () => { */
     const response = await fetch(url)
     const users = await response.json()
 
//-    // Note this next line will cause an infinite loop since `useEffect` will be
//-    // triggered every time `setusers` is called
//-    // setUsers(users)
    setusers(users)
     console.log(users)
   }
 
   useEffect(() => {
     getUsers()
//-  })
  }, []) // only run on initial render
 
   return (
     <>
```

###### :boat: [display github user info](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6a1dcd6)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* index 827180f..ba107fe 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* +++ b/react-advanced-2020-master/src/tutorial/2-useEffect/setup/3-useEffect-fetch-data.js */
/* @@ -21,6 +21,20 @@ const UseEffectFetchData = () => { */
   return (
     <>
       <h3>github users</h3>
      <ul className='users'>
        {users.map((user) => {
          const { id, login, avatar_url, html_url } = user
          return (
            <li key={id}>
              <img src={avatar_url} alt={login} />
              <div>
                <h4>{login}</h4>
                <a href={html_url}>Profile</a>
              </div>
            </li>
          )
        })}
      </ul>
     </>
   )
 }
```

## Returns and Operators

### 51. Multiple Returns - Basics

###### :boat: [setup](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/73529db)

###### :boat: [when we have multiple `return`, only the first returns](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9ec4a2e)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* index c78760f..e92cd64 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* @@ -3,6 +3,7 @@ import React, { useState, useEffect } from 'react' */
 const url = 'https://api.github.com/users/QuincyLarson'
 
 const MultipleReturns = () => {
  return 'hello world'
   return <h2>multiple returns</h2>
 }
```

###### :boat: [basic conditional return](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/913b177)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* index e92cd64..a0bf349 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* @@ -3,7 +3,11 @@ import React, { useState, useEffect } from 'react' */
 const url = 'https://api.github.com/users/QuincyLarson'
 
 const MultipleReturns = () => {
//-  return 'hello world'
  const [loading, setLoading] = useState(true)

  if (loading) {
    return <h2>Loading...</h2>
  }
   return <h2>multiple returns</h2>
 }
```

### 52. Multiple Returns - Fetching Example

###### :boat: [Conditional return with `fetch` example](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6d3dbb1)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* index a0bf349..e51e127 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* @@ -3,12 +3,36 @@ import React, { useState, useEffect } from 'react' */
 const url = 'https://api.github.com/users/QuincyLarson'
 
 const MultipleReturns = () => {
//-  const [loading, setLoading] = useState(true)
  const [isLoading, setIsLoading] = useState(false)
  const [isError, setIsError] = useState(false)
  const [user, setUser] = useState('default user')
 
//-  if (loading) {
//-    return <h2>Loading...</h2>
  useEffect(() => {
    fetch(url)
      .then((resp) => resp.json())
      .then((user) => console.log(user))
      .catch((error) => console.log(error))
  }, [])

  if (isLoading) {
    return (
      <div>
        <h1>Loading...</h1>
      </div>
    )
  }
  if (isError) {
    return (
      <div>
        <h1>Error...</h1>
      </div>
    )
   }
//-  return <h2>multiple returns</h2>
  return (
    <div>
      <h1>{user}</h1>
    </div>
  )
 }
 
 export default MultipleReturns
```

###### :boat: [Display the user](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/21a2fb8)
```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* index e51e127..69a759f 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/1-multiple-returns.js */
/* @@ -8,9 +8,15 @@ const MultipleReturns = () => { */
   const [user, setUser] = useState('default user')
 
   useEffect(() => {
    setIsLoading(true)

     fetch(url)
       .then((resp) => resp.json())
//-      .then((user) => console.log(user))
      .then((user) => {
        const { login } = user
        setUser(login)
        setIsLoading(false)
      })
       .catch((error) => console.log(error))
   }, [])
```

###### :memo: In `Developer Tools -> Network`, we can select a slower network e.g. `Slow 3G` to see the state changes as if we're on a slow network

###### :boat: [test a 404 error by passing invalid url](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d7d18919aa12eddd1387adb6099be505283f5b09)
```jsx
import React, { useState, useEffect } from 'react'

//- const url = 'https://api.github.com/users/QuincyLarson'
 const url = 'https://api.github.com/users/QuincyLarsons'

const MultipleReturns = () => {
  const [isLoading, setIsLoading] = useState(false)
```

###### :boat: [Handle errors](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/2f9a98879c0cec66ef739be6581d8634381be339)
```jsx

    setIsLoading(true)

    fetch(url)
//-     .then((resp) => resp.json())
     .then((resp) => {
       if (resp.status >= 200 && resp.status <= 200) {
         return resp.json()
       } else {
         setIsLoading(false)
         setIsError(true)
         throw new Error(resp.statusText)
       }
     })
      .then((user) => {
        const { login } = user
        setUser(login)
```

###### :boat: [remove deliberate error to see success](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4c31bf48a350038fcfc20c81ae7bdddea0550f37)

```jsx

import React, { useState, useEffect } from 'react'

//- const url = 'https://api.github.com/users/QuincyLarsons'
 const url = 'https://api.github.com/users/QuincyLarson'

const MultipleReturns = () => {
  const [isLoading, setIsLoading] = useState(false)
```

### 53. Short-Circuit Evaluation

###### :key: [Starter Code 3-conditional-rendering/setup/2-short-circuit.js](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/blob/main/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js)

###### :boat: [displays "Hello World, Value: <blank>"](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/aacfee8)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* index cbdaacb..a8a5681 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* @@ -1,12 +1,18 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 // short-circuit evaluation
 // ternary operator
 
 const ShortCircuit = () => {
//-  // const firstValue = text || 'hello world';
//-  // const secondValue = text && 'hello world';
  const [text, settext] = useState('')
  const firstValue = text || 'hello world'
  const secondValue = text && 'hello world'
 
//-  return <h2>short circuit</h2>;
//-};
  return (
    <>
      <h1>{firstValue}</h1>
      <h1>value: {secondValue}</h1>
    </>
  )
}
 
//-export default ShortCircuit;
export default ShortCircuit
```

###### :boat: [this will display "Peter"](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/842b8e7)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* index a8a5681..b5133ac 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* @@ -3,14 +3,13 @@ import React, { useState } from 'react' */
 // ternary operator
 
 const ShortCircuit = () => {
//-  const [text, settext] = useState('')
  const [text, settext] = useState('peter')
   const firstValue = text || 'hello world'
   const secondValue = text && 'hello world'
 
   return (
     <>
//-      <h1>{firstValue}</h1>
//-      <h1>value: {secondValue}</h1>
      <h1>{text || 'john doe'}</h1>
     </>
   )
 }
```

###### :boat: [short circuit operators summarized](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/176084f)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* index b5133ac..3969314 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* @@ -3,13 +3,15 @@ import React, { useState } from 'react' */
 // ternary operator
 
 const ShortCircuit = () => {
//-  const [text, settext] = useState('peter')
  const [text, settext] = useState('Peter')
   const firstValue = text || 'hello world'
   const secondValue = text && 'hello world'
 
   return (
     <>
//-      <h1>{text || 'john doe'}</h1>
      <h1>{text || 'john'}</h1> {/* John if text is empty, else text */}
      {text && <h1>text is not empty</h1>} {/* Dispays if text is not empty */}
      {!text && <h1>text is empty</h1>} {/* Dispays if text is empty */}
     </>
   )
 }
```

### 54. Ternary Operator

###### :boat: [Ternary Operator](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/fc05fa3)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* index 3969314..198a3e9 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/2-short-circuit.js */
/* @@ -4,14 +4,17 @@ import React, { useState } from 'react' */
 
 const ShortCircuit = () => {
   const [text, settext] = useState('Peter')
//-  const firstValue = text || 'hello world'
//-  const secondValue = text && 'hello world'
  const [isError, setIsError] = useState(false)
 
   return (
     <>
       <h1>{text || 'john'}</h1> {/* John if text is empty, else text */}
       {text && <h1>text is not empty</h1>} {/* Dispays if text is not empty */}
       {!text && <h1>text is empty</h1>} {/* Dispays if text is empty */}
      <button className='btn' onClick={() => setIsError(!isError)}>
        toggle error
      </button>
      {isError ? <p>Error ...</p> : <p>Not an error</p>}
     </>
   )
 }
```

### 55. Show/Hide Component

:key: [Starter code 3-conditional-rendering/setup/3-show-hide.js](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/blob/main/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js)

###### :boat: [Simple toggle of a component](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/be7d3ff)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js */
/* index ba1bb94..3277217 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js */
/* @@ -1,7 +1,24 @@ */
//-import React, { useState, useEffect } from 'react';
import React, { useState, useEffect } from 'react'
 
 const ShowHide = () => {
//-  return <h2>show/hide</h2>;
//-};
  const [show, setShow] = useState(false)
  return (
    <>
      <button className='btn' onClick={() => setShow(!show)}>
        show/hide
      </button>
      {show && <Item />}
    </>
  )
}
 
//-export default ShowHide;
const Item = () => {
  return (
    <div style={{ marginTop: '2rem' }}>
      <h1>window</h1>
      <h1>size : </h1>
    </div>
  )
}

export default ShowHide
```

###### :boat: [Complete the toggle. :imp: We have to clean up the event listeners](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/fceba09)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js */
/* index 3277217..5755218 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js */
/* +++ b/react-advanced-2020-master/src/tutorial/3-conditional-rendering/setup/3-show-hide.js */
/* @@ -13,10 +13,25 @@ const ShowHide = () => { */
 }
 
 const Item = () => {
  const [size, setSize] = useState(window.innerWidth)

  const checkSize = () => {
    setSize(window.innerWidth)
  }

  useEffect(() => {
    window.addEventListener('resize', checkSize)

    // needed b'se since we toggle the component, having the `[]` dependency isn't sufficient to avoid creating unlimited listeners
    return () => {
      window.removeEventListener('resize', checkSize)
    }
  }, [])

   return (
     <div style={{ marginTop: '2rem' }}>
       <h1>window</h1>
//-      <h1>size : </h1>
      <h1>size : {size}</h1>
     </div>
   )
 }
```

### 56. Matching Projects

* [Project: Tours](#91-Tours---Intro)
* [Project: Reviews](#96-Reviews---Intro)
* [Project: Accordion](#101-Accordion---Intro)
* [Project: Menu](#103-Menu---Intro)
* [Project: Tabs](#108-Tabs---Intro)
* [Project: Slider](#112-Slider---Intro)

## Forms

### 57. Form Basics

[Project folder: `/tutorial/4-forms`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-advanced-2020-master/src/tutorial/4-forms)

###### :boat: [setup for `1-controlled-inputs`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5c0a351)

```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index ef29a05..4a5f04a 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/3-conditional-rendering/setup/3-show-hide'
import Setup from './tutorial/4-forms/setup/1-controlled-inputs'
 
 function App() {
   return (
```

###### :boat: [basic form](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/622996c)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 3fdcee8..4ac9d78 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -1,4 +1,4 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 // JS
 // const input = document.getElementById('myText');
 // const inputValue = input.value
/* @@ -6,7 +6,23 @@ import React, { useState } from 'react'; */
 // value, onChange
 
 const ControlledInputs = () => {
//-  return <h1>controlled inputs</h1>;
//-};
  return (
    <>
      <article>
        <form className='form'>
          <div className='form-control'>
            <label htmlFor='firstName'>Name : </label>
            <input type='text' id='firstName' name='firstName' />
          </div>
          <div className='form-control'>
            <label htmlFor='email'>Email : </label>
            <input type='text' id='email' name='email' />
          </div>
          <button type='submit'>add person</button>
        </form>
      </article>
    </>
  )
}
 
//-export default ControlledInputs;
export default ControlledInputs
```

###### :boat: [handle submit of form](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/788dec9)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 4ac9d78..50016cb 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -6,10 +6,16 @@ import React, { useState } from 'react' */
 // value, onChange
 
 const ControlledInputs = () => {
  const handleSubmit = (e) => {
    e.preventDefault() // without this form will submit and refresh page before we get to the console.log
    console.log('hello world')
  }

   return (
     <>
       <article>
//-        <form className='form'>
        {/* alternative to `onSubmit` is `onClick` in the button below */}
        <form className='form' onSubmit={handleSubmit}>
           <div className='form-control'>
             <label htmlFor='firstName'>Name : </label>
             <input type='text' id='firstName' name='firstName' />
```

### 58. Controlled Inputs

###### :boat: [default field `value`. :imp: React will complain I havent set `onChange`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5e7f451)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 50016cb..ccd646e 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -6,6 +6,9 @@ import React, { useState } from 'react' */
 // value, onChange
 
 const ControlledInputs = () => {
  const [firstName, setfirstName] = useState('')
  const [email, setemail] = useState('')

   const handleSubmit = (e) => {
     e.preventDefault() // without this form will submit and refresh page before we get to the console.log
     console.log('hello world')
/* @@ -18,11 +21,16 @@ const ControlledInputs = () => { */
         <form className='form' onSubmit={handleSubmit}>
           <div className='form-control'>
             <label htmlFor='firstName'>Name : </label>
//-            <input type='text' id='firstName' name='firstName' />
            <input
              type='text'
              id='firstName'
              name='firstName'
              value={firstName}
            />
           </div>
           <div className='form-control'>
             <label htmlFor='email'>Email : </label>
//-            <input type='text' id='email' name='email' />
            <input type='text' id='email' name='email' value={email} />
           </div>
           <button type='submit'>add person</button>
         </form>
```

:bulb: At this point we can view the `ControlledInputs` in the Components tab
of React Dev tools to view changes in state as I input text in the input fields

###### :boat: [renaming is hard](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/fefa287)

### 59. Add Item to the List

###### :boat: [Handle "submitting" form if neither firstName nor email are empty](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1f65fa0)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 670a3cd..54f5938 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -8,10 +8,17 @@ import React, { useState } from 'react' */
 const ControlledInputs = () => {
   const [firstName, setFirstName] = useState('')
   const [email, setEmail] = useState('')
  const [people, setPeople] = useState([])
 
   const handleSubmit = (e) => {
     e.preventDefault() // without this form will submit and refresh page before we get to the console.log
//-    console.log('hello world')

    // only allow submit if neither is empty
    if (firstName && email) {
      console.log('I can submit the form now')
    } else {
      console.log('empty values')
    }
   }
 
   return (
```

###### :boat: [`setPeople` on form submit](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f92614f)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 54f5938..089c824 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -15,7 +15,10 @@ const ControlledInputs = () => { */
 
     // only allow submit if neither is empty
     if (firstName && email) {
//-      console.log('I can submit the form now')
      const person = { firstName: firstName, email: email }
      setPeople((people) => {
        return [...people, person]
      })
     } else {
       console.log('empty values')
     }
```

###### :boat: [Clear the form on submit so I can enter new values](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b2e2300)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 089c824..60ecea7 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -19,6 +19,8 @@ const ControlledInputs = () => { */
       setPeople((people) => {
         return [...people, person]
       })
      setFirstName('')
      setEmail('')
     } else {
       console.log('empty values')
     }
```

###### :boat: [Display submitted form values](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/2738295)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 60ecea7..387246f 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -53,6 +53,15 @@ const ControlledInputs = () => { */
           </div>
           <button type='submit'>add person</button>
         </form>
        {people.map((person) => {
          const { id, firstName, email } = person
          return (
            <div className='item'>
              <h4>{firstName}</h4>
              <p>{email}</p>
            </div>
          )
        })}
       </article>
     </>
   )
```

###### :boat: [:bulb: Use `Date` to assign unique id for now. :imp: We should use uuid library instead](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/389ad9d)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* index 387246f..e47ee8b 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/1-controlled-inputs.js */
/* @@ -15,7 +15,11 @@ const ControlledInputs = () => { */
 
     // only allow submit if neither is empty
     if (firstName && email) {
//-      const person = { firstName: firstName, email: email }
      const person = {
        id: new Date().getTime().toString(), // we should use UUID, but this works for now
        firstName: firstName,
        email: email,
      }
       setPeople((people) => {
         return [...people, person]
       })
/* @@ -56,7 +60,7 @@ const ControlledInputs = () => { */
         {people.map((person) => {
           const { id, firstName, email } = person
           return (
//-            <div className='item'>
            <div key={id} className='item'>
               <h4>{firstName}</h4>
               <p>{email}</p>
             </div>
```

### 60. Multiple Inputs

###### :boat: [Starter code, which is like the previous example, but will be heavily refactored](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/0ce617c)

```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index 4a5f04a..41b3e7e 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/4-forms/setup/1-controlled-inputs'
import Setup from './tutorial/4-forms/setup/2-multiple-inputs'
 
 function App() {
   return (
```

###### :boat: [Add an additional field to make the form more complex](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/32ee836)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* index 1959910..d7fcb25 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* @@ -1,4 +1,4 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 // JS
 // const input = document.getElementById('myText');
 // const inputValue = input.value
/* @@ -7,24 +7,25 @@ import React, { useState } from 'react'; */
 // dynamic object keys
 
 const ControlledInputs = () => {
//-  const [firstName, setFirstName] = useState('');
//-  const [email, setEmail] = useState('');
//-  const [people, setPeople] = useState([]);
  const [firstName, setFirstName] = useState('')
  const [age, setAge] = useState('')
  const [email, setEmail] = useState('')
  const [people, setPeople] = useState([])
 
   const handleSubmit = (e) => {
//-    e.preventDefault();
    e.preventDefault()
     if (firstName && email) {
//-      const person = { id: new Date().getTime().toString(), firstName, email };
//-      console.log(person);
      const person = { id: new Date().getTime().toString(), firstName, email }
      console.log(person)
       setPeople((people) => {
//-        return [...people, person];
//-      });
//-      setFirstName('');
//-      setEmail('');
        return [...people, person]
      })
      setFirstName('')
      setEmail('')
     } else {
//-      console.log('empty values');
      console.log('empty values')
     }
//-  };
  }
   return (
     <>
       <article>
/* @@ -39,6 +40,16 @@ const ControlledInputs = () => { */
               onChange={(e) => setFirstName(e.target.value)}
             />
           </div>
          <div className='form-control'>
            <label htmlFor='age'>Age : </label>
            <input
              type='text'
              id='age'
              name='age'
              value={age}
              onChange={(e) => setAge(e.target.value)}
            />
          </div>
           <div className='form-control'>
             <label htmlFor='email'>Email : </label>
             <input
/* @@ -52,17 +63,17 @@ const ControlledInputs = () => { */
           <button type='submit'>add person</button>
         </form>
         {people.map((person, index) => {
//-          const { id, firstName, email } = person;
          const { id, firstName, email } = person
           return (
             <div className='item' key={id}>
               <h4>{firstName}</h4>
               <p>{email}</p>
             </div>
//-          );
          )
         })}
       </article>
     </>
//-  );
//-};
  )
}
 
//-export default ControlledInputs;
export default ControlledInputs
```

###### :boat: [delete `handleSubmit` to rewrite later](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6d5b9f7)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* index d7fcb25..53d8b26 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* @@ -12,20 +12,6 @@ const ControlledInputs = () => { */
   const [email, setEmail] = useState('')
   const [people, setPeople] = useState([])
 
//-  const handleSubmit = (e) => {
//-    e.preventDefault()
//-    if (firstName && email) {
//-      const person = { id: new Date().getTime().toString(), firstName, email }
//-      console.log(person)
//-      setPeople((people) => {
//-        return [...people, person]
//-      })
//-      setFirstName('')
//-      setEmail('')
//-    } else {
//-      console.log('empty values')
//-    }
//-  }
   return (
     <>
       <article>
```

###### :boat: [skeleton `handleChange` and `handleSubmit`. :bulb: were using `onClick` in the button instead of `handleSubmit` on the form, which is functionally the same](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/513b472)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* index 53d8b26..8ea91e5 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* @@ -7,23 +7,26 @@ import React, { useState } from 'react' */
 // dynamic object keys
 
 const ControlledInputs = () => {
//-  const [firstName, setFirstName] = useState('')
//-  const [age, setAge] = useState('')
//-  const [email, setEmail] = useState('')
  const [person, setPerson] = useState({ firstName: '', age: '', email: '' })
   const [people, setPeople] = useState([])
 
  const handleChange = (e) => {}
  const handleSubmit = (e) => {
    e.preventDefault()
  }

   return (
     <>
       <article>
//-        <form className='form' onSubmit={handleSubmit}>
        <form className='form'>
           <div className='form-control'>
             <label htmlFor='firstName'>Name : </label>
             <input
               type='text'
               id='firstName'
               name='firstName'
//-              value={firstName}
//-              onChange={(e) => setFirstName(e.target.value)}
              value={person.firstName}
              onChange={(e) => handleChange(e)}
             />
           </div>
           <div className='form-control'>
/* @@ -32,8 +35,8 @@ const ControlledInputs = () => { */
               type='text'
               id='age'
               name='age'
//-              value={age}
//-              onChange={(e) => setAge(e.target.value)}
              value={person.age}
              onChange={(e) => handleChange(e)}
             />
           </div>
           <div className='form-control'>
/* @@ -42,12 +45,15 @@ const ControlledInputs = () => { */
               type='email'
               id='email'
               name='email'
//-              value={email}
//-              onChange={(e) => setEmail(e.target.value)}
              value={person.email}
              onChange={(e) => handleChange(e)}
             />
           </div>
//-          <button type='submit'>add person</button>
          <button type='submit' onClick={(e) => handleChange(e)}>
            add person
          </button>
         </form>

         {people.map((person, index) => {
           const { id, firstName, email } = person
           return (
```

###### :boat: [Update `person` based on form input using **dynamic object keys**](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/29ba40c)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* index 8ea91e5..8e59089 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* @@ -10,7 +10,13 @@ const ControlledInputs = () => { */
   const [person, setPerson] = useState({ firstName: '', age: '', email: '' })
   const [people, setPeople] = useState([])
 
//-  const handleChange = (e) => {}
  const handleChange = (e) => {
    const name = e.target.name // get this from `name` on the input field
    const value = e.target.value // the text entered in the input
    setPerson({ ...person, [name]: value })
    console.log(person)
  }

   const handleSubmit = (e) => {
     e.preventDefault()
   }
```

###### :boat: [`handleSubmit` of the form and add new record to `people`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/744afe8)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* index 8e59089..4bfde81 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* @@ -14,11 +14,16 @@ const ControlledInputs = () => { */
     const name = e.target.name // get this from `name` on the input field
     const value = e.target.value // the text entered in the input
     setPerson({ ...person, [name]: value })
//-    console.log(person)
   }
 
   const handleSubmit = (e) => {
     e.preventDefault()
    if (person.firstName && person.email && person.age) {
      const newPerson = { ...person, id: new Date().getTime().toString() }
      console.log(newPerson)
      setPeople([...people, newPerson])
      setPerson({ firstName: '', email: '', age: '' })
    }
   }
 
   return (
/* @@ -32,7 +37,7 @@ const ControlledInputs = () => { */
               id='firstName'
               name='firstName'
               value={person.firstName}
//-              onChange={(e) => handleChange(e)}
              onChange={handleChange}
             />
           </div>
           <div className='form-control'>
/* @@ -42,29 +47,30 @@ const ControlledInputs = () => { */
               id='age'
               name='age'
               value={person.age}
//-              onChange={(e) => handleChange(e)}
              onChange={handleChange}
             />
           </div>
           <div className='form-control'>
             <label htmlFor='email'>Email : </label>
             <input
//-              type='email'
              type='text'
               id='email'
               name='email'
               value={person.email}
//-              onChange={(e) => handleChange(e)}
              onChange={handleChange}
             />
           </div>
//-          <button type='submit' onClick={(e) => handleChange(e)}>
          <button type='submit' onClick={handleSubmit}>
             add person
           </button>
         </form>
 
         {people.map((person, index) => {
//-          const { id, firstName, email } = person
          const { id, firstName, email, age } = person
           return (
             <div className='item' key={id}>
               <h4>{firstName}</h4>
              <h4>{age}</h4>
               <p>{email}</p>
             </div>
           )
```

:bulb: Note how you call the event handlers. 

:a: :imp: Unclear why I don't need to `onChange={() => handleChange(e)}` instead of just `onChange={handleChange}`


###### :boat: [example of calling a function with params in event handler](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6b9a98c)

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* index 4bfde81..ad2d6aa 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* +++ b/react-advanced-2020-master/src/tutorial/4-forms/setup/2-multiple-inputs.js */
/* @@ -60,7 +60,7 @@ const ControlledInputs = () => { */
               onChange={handleChange}
             />
           </div>
//-          <button type='submit' onClick={handleSubmit}>
          <button type='submit' onClick={(e) => handleSubmit(e)}>
             add person
           </button>
         </form>
```

### 61. Matching Projects

* [Project: Lorem Ipsum - Intro](#119-Lorem-Ipsum---Intro)
* [Project: Color Generator - Intro](122.-Color-Generator---Intro)
* [Project: Grocery Bud - Intro](127.-Grocery-Bud---Intro)

## useRef
### 62. useRef

###### :boat: [useRef is similar to useState but simplified to avoid re-renders](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/bfb9ee5)

```jsx
/* diff --git a/react-advanced-2020-master/src/App.js b/react-advanced-2020-master/src/App.js */
/* index 41b3e7e..5d2f312 100644 */
/* --- a/react-advanced-2020-master/src/App.js */
/* +++ b/react-advanced-2020-master/src/App.js */
/* @@ -1,5 +1,5 @@ */
 import React from 'react'
//-import Setup from './tutorial/4-forms/setup/2-multiple-inputs'
import Setup from './tutorial/5-useRef/setup/1-useRef-basics'
 
 function App() {
   return (
```

```jsx
/* diff --git a/react-advanced-2020-master/src/tutorial/5-useRef/setup/1-useRef-basics.js b/react-advanced-2020-master/src/tutorial/5-useRef/setup/1-useRef-basics.js */
/* index 4998fb5..1dea8ac 100644 */
/* --- a/react-advanced-2020-master/src/tutorial/5-useRef/setup/1-useRef-basics.js */
/* +++ b/react-advanced-2020-master/src/tutorial/5-useRef/setup/1-useRef-basics.js */
/* @@ -1,11 +1,38 @@ */
//-import React, { useEffect, useRef } from 'react';
import React, { useEffect, useRef } from 'react'
 
//-// preserves value
//-// DOES NOT trigger re-render
//-// target DOM nodes/elements
// Works similar to useState
//- preserves value
//- DOES NOT trigger re-render
//- target DOM nodes/elements
 
 const UseRefBasics = () => {
//-  return <h2>useRef</h2>;
//-};
  const refContainer = useRef(null)
  const divContainer = useRef(null)
 
//-export default UseRefBasics;
  const handleSubmit = (e) => {
    e.preventDefault()
    console.log(refContainer.current.value)
    console.log(divContainer.current.innerHTML)
  }
  console.log(refContainer)

  // on initial render, focus on the input field
  useEffect(() => {
    console.log(refContainer.current)
    refContainer.current.focus()
  }) // Does not require dependency array since useRef does not rerender

  return (
    <>
      <form className='form' onSubmit={handleSubmit}>
        <div>
          <input type='text' ref={refContainer} />
          <button type='submit'>Submit</button>
        </div>
        <div ref={divContainer}>hello world</div>
      </form>
    </>
  )
}

export default UseRefBasics
```

### 63. Matching Project

[Matching Project: Navbar - Intro](#135-Navbar---Intro)

## useReducer

### 64. useReducer - useState Setup
### 65. useReducer - Refactor
### 66. useReducer - Add Item
### 67. useReducer - Remove Item

## Prop Drilling, Context API, useContext
### 68. Prop Drilling
### 69. Context API / useContext
### 70. Matching Projects

## Custom Hooks, useFetch, PropTypes

### 71. Custom Hooks - useFetch
### 72. PropTypes - Setup
### 73. PropTypes - Images
### 74. PropTypes - Default Values

## React Router

### 75. React Router Intro
### 76. React Router - Basic Setup
### 77. React Router - Error and Switch Component
### 78. React Router - Links
### 79. React Router - Url Params and Placeholder
### 80. React Optimization Warning!!!!
### 81. React.memo
### 82. useCallback
### 83. useMemo
### 84. useCallback - Fetch Example
### 85. Matching Project
# Section 5: Basic Projects

## Intro & Starter Projects

### 86. Intro

https://react-projects.netlify.app/ for live views of completed projects

https://github.com/john-smilga/react-projects for starter code

###### :boat: [Cloned starter code for projects](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/311ffd5)

### 87. Starter Project - Install and Overview

Each Project has a `setup` and `final` directory
* `setup` is the boilerplate
* `final` to view completed code

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/a32a5f5)

## Birthday Reminder

### 88. Birthday Reminder - Intro

https://react-projects-1-birthday-reminder.netlify.app/ to see final product
* simple list of birthdays
* `clear all` functionality

### 89. Birthday Reminder - Setup

###### :boat: [Start with static code for display](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5b854f3)
```jsx
/* diff --git a/react-projects/1-birthday-reminder/setup/src/App.js b/react-projects/1-birthday-reminder/setup/src/App.js */
/* index 62fa05a..bd4f9fe 100644 */
/* --- a/react-projects/1-birthday-reminder/setup/src/App.js */
/* +++ b/react-projects/1-birthday-reminder/setup/src/App.js */
/* @@ -3,7 +3,17 @@ import data from './data' */
 import List from './List'
 
 function App() {
//-  return <h2>reminder project setup</h2>
  return (
    <main>
      <section className='container'>
        <h3>0 birthdays today</h3>
        <List />
        <button className='btn' onClick={() => console.log('you clicked me')}>
          Clear All
        </button>
      </section>
    </main>
  )
 }
 
 export default App
```

### 90. Birthday Reminder - Complete

###### :boat: [`people useState` using `./data.js`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6019e45)
```jsx
/* diff --git a/react-projects/1-birthday-reminder/setup/src/App.js b/react-projects/1-birthday-reminder/setup/src/App.js */
/* index bd4f9fe..0e51677 100644 */
/* --- a/react-projects/1-birthday-reminder/setup/src/App.js */
/* +++ b/react-projects/1-birthday-reminder/setup/src/App.js */
/* @@ -3,6 +3,8 @@ import data from './data' */
 import List from './List'
 
 function App() {
  const [people, setPeople] = useState(data)

   return (
     <main>
       <section className='container'>
```
    
```jsx
/* diff --git a/react-projects/1-birthday-reminder/setup/src/List.js b/react-projects/1-birthday-reminder/setup/src/List.js */
/* index 53d6134..f05dc7f 100644 */
/* --- a/react-projects/1-birthday-reminder/setup/src/List.js */
/* +++ b/react-projects/1-birthday-reminder/setup/src/List.js */
/* @@ -1,11 +1,11 @@ */
//-import React from 'react';
import React from 'react'
 
 const List = () => {
   return (
     <>
       <h2>list component</h2>
     </>
//-  );
//-};
  )
}
 
//-export default List;
export default List
```

###### :boat: [add `people` props to `<List />`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b8e5d6e)
```jsx
/* diff --git a/react-projects/1-birthday-reminder/setup/src/App.js b/react-projects/1-birthday-reminder/setup/src/App.js */
/* index 0e51677..e6db70d 100644 */
/* --- a/react-projects/1-birthday-reminder/setup/src/App.js */
/* +++ b/react-projects/1-birthday-reminder/setup/src/App.js */
/* @@ -8,8 +8,8 @@ function App() { */
   return (
     <main>
       <section className='container'>
//-        <h3>0 birthdays today</h3>
//-        <List />
        <h3>{people.length} birthdays today</h3>
        <List people={people} />
         <button className='btn' onClick={() => console.log('you clicked me')}>
           Clear All
         </button>
```

## Tours

### 91. Tours - Intro

:key: [Setup Code for Tours project](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/2-tours/setup)

:key: [Completed Tours app](https://react-projects-2-tours.netlify.app/)

###### :boat: [Set up skeleton logic for `<Loading>` and `<Tours>`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/42d40e3)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/App.js b/react-projects/2-tours/setup/src/App.js */
/* index d379557..286030a 100644 */
/* --- a/react-projects/2-tours/setup/src/App.js */
/* +++ b/react-projects/2-tours/setup/src/App.js */
/* @@ -5,7 +5,22 @@ import Tours from './Tours' */
 // I SWITCHED TO PERMANENT DOMAIN
 const url = 'https://course-api.com/react-tours-project'
 function App() {
//-  return <h2>Tours Project Setup</h2>
  const [loading, setLoading] = useState(true)
  const [tours, setTours] = useState([])

  if (loading) {
    return (
      <main>
        <Loading />
      </main>
    )
  } else {
    return (
      <main>
        <Tours />
      </main>
    )
  }
 }
 
 export default App
```

### 92. Tours - Fetch Data

###### :boat: [Fetch our data with `fetch`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/a3c53aa)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/App.js b/react-projects/2-tours/setup/src/App.js */
/* index 286030a..996e7b8 100644 */
/* --- a/react-projects/2-tours/setup/src/App.js */
/* +++ b/react-projects/2-tours/setup/src/App.js */
/* @@ -8,6 +8,24 @@ function App() { */
   const [loading, setLoading] = useState(true)
   const [tours, setTours] = useState([])
 
  const fetchTours = async () => {
    setLoading(true)

    try {
      const response = await fetch(url)
      const tours = await response.json()
      setLoading(false)
      setTours(tours)
    } catch (error) {
      setLoading(false)
      console.log('Error')
    }
  }

  useEffect(() => {
    fetchTours()
  }, [])

   if (loading) {
     return (
       <main>
```

###### :boat: [Initial `<Tours ... />` setup to see component rendered for each record in tours](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/ead9a9b)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/App.js b/react-projects/2-tours/setup/src/App.js */
/* index 996e7b8..3047a7c 100644 */
/* --- a/react-projects/2-tours/setup/src/App.js */
/* +++ b/react-projects/2-tours/setup/src/App.js */
/* @@ -35,7 +35,7 @@ function App() { */
   } else {
     return (
       <main>
//-        <Tours />
        <Tours tours={tours} />
       </main>
     )
   }
```

```jsx
/* diff --git a/react-projects/2-tours/setup/src/Tours.js b/react-projects/2-tours/setup/src/Tours.js */
/* index 9c27fe7..315071a 100644 */
/* --- a/react-projects/2-tours/setup/src/Tours.js */
/* +++ b/react-projects/2-tours/setup/src/Tours.js */
/* @@ -1,7 +1,20 @@ */
//-import React from 'react';
//-import Tour from './Tour';
//-const Tours = () => {
//-  return <h2>tours component</h2>;
//-};
import React from 'react'
import Tour from './Tour'
 
//-export default Tours;
const Tours = ({ tours }) => {
  return (
    <section>
      <div className='title'>
        <h2>Our tours</h2>
        <div className='underline'></div>
      </div>
      <div>
        {tours.map((tour) => {
          return <Tour key={tour.id} {...tour} />
        })}
      </div>
    </section>
  )
}

export default Tours
```

:imp: using **spread operator** as prop to `<Tour />`

### 93. Tours - Display Tours

###### :boat: [Display individual `<Tour />`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9924bc4)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/Tour.js b/react-projects/2-tours/setup/src/Tour.js */
/* index 0e96e0b..1dc8e95 100644 */
/* --- a/react-projects/2-tours/setup/src/Tour.js */
/* +++ b/react-projects/2-tours/setup/src/Tour.js */
/* @@ -1,7 +1,19 @@ */
//-import React, { useState } from 'react';
import React, { useState } from 'react'
 
//-const Tour = () => {
//-  return <h2>tour component</h2>;
//-};
const Tour = ({ name, price, image, info }) => {
  return (
    <article className='single-tour'>
      <img src={image} alt={name} />
      <footer>
        <div className='tour-info'>
          <h4>{name}</h4>
          <h4 className='tour-price'>${price}</h4>
        </div>
        <p>{info}</p>
        <button className='delete-btn'>Not Interested</button>
      </footer>
    </article>
  )
}
 
//-export default Tour;
export default Tour
```

###### :boat: [Default display of Tour info to be shortened, with a `Read More` functionality](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/49467de)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/Tour.js b/react-projects/2-tours/setup/src/Tour.js */
/* index 1dc8e95..49a9668 100644 */
/* --- a/react-projects/2-tours/setup/src/Tour.js */
/* +++ b/react-projects/2-tours/setup/src/Tour.js */
/* @@ -1,6 +1,8 @@ */
 import React, { useState } from 'react'
 
 const Tour = ({ name, price, image, info }) => {
  const [readMore, setReadMore] = useState(false)
  console.log(info)
   return (
     <article className='single-tour'>
       <img src={image} alt={name} />
/* @@ -9,7 +11,12 @@ const Tour = ({ name, price, image, info }) => { */
           <h4>{name}</h4>
           <h4 className='tour-price'>${price}</h4>
         </div>
//-        <p>{info}</p>
        <p>
          {readMore ? info : `${info.substring(0, 50)}...`}
          <button onClick={() => setReadMore(!readMore)}>
            {readMore ? 'show less' : 'read more'}
          </button>
        </p>
         <button className='delete-btn'>Not Interested</button>
       </footer>
     </article>
```

### 94. Tours - Toggle Info

###### :boat: [Have to **prop drill** to pass `removeTour` functionality from App since thats where the `Tour` state is stored](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9b7262d)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/App.js b/react-projects/2-tours/setup/src/App.js */
/* index 3047a7c..7bcbacf 100644 */
/* --- a/react-projects/2-tours/setup/src/App.js */
/* +++ b/react-projects/2-tours/setup/src/App.js */
/* @@ -8,6 +8,11 @@ function App() { */
   const [loading, setLoading] = useState(true)
   const [tours, setTours] = useState([])
 
  const removeTour = (id) => {
    const newTours = tours.filter((tour) => tour.id !== id)
    setTours(newTours)
  }

   const fetchTours = async () => {
     setLoading(true)
 
/* @@ -35,7 +40,7 @@ function App() { */
   } else {
     return (
       <main>
//-        <Tours tours={tours} />
        <Tours tours={tours} removeTour={removeTour} />
       </main>
     )
   }
```

```jsx
/* diff --git a/react-projects/2-tours/setup/src/Tour.js b/react-projects/2-tours/setup/src/Tour.js */
/* index 49a9668..87fa558 100644 */
/* --- a/react-projects/2-tours/setup/src/Tour.js */
/* +++ b/react-projects/2-tours/setup/src/Tour.js */
/* @@ -1,6 +1,6 @@ */
 import React, { useState } from 'react'
 
//-const Tour = ({ name, price, image, info }) => {
const Tour = ({ id, name, price, image, info, removeTour }) => {
   const [readMore, setReadMore] = useState(false)
   console.log(info)
   return (
/* @@ -17,7 +17,9 @@ const Tour = ({ name, price, image, info }) => { */
             {readMore ? 'show less' : 'read more'}
           </button>
         </p>
//-        <button className='delete-btn'>Not Interested</button>
        <button className='delete-btn' onClick={() => removeTour(id)}>
          Not Interested
        </button>
       </footer>
     </article>
   )
```

```jsx
/* diff --git a/react-projects/2-tours/setup/src/Tours.js b/react-projects/2-tours/setup/src/Tours.js */
/* index 315071a..362d49d 100644 */
/* --- a/react-projects/2-tours/setup/src/Tours.js */
/* +++ b/react-projects/2-tours/setup/src/Tours.js */
/* @@ -1,7 +1,7 @@ */
 import React from 'react'
 import Tour from './Tour'
 
//-const Tours = ({ tours }) => {
const Tours = ({ tours, removeTour }) => {
   return (
     <section>
       <div className='title'>
/* @@ -10,7 +10,7 @@ const Tours = ({ tours }) => { */
       </div>
       <div>
         {tours.map((tour) => {
//-          return <Tour key={tour.id} {...tour} />
          return <Tour key={tour.id} {...tour} removeTour={removeTour} />
         })}
       </div>
     </section>
```

### 95. Tours - Remove Tour

###### :boat: [Conditionally display message when No Tours Found](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9baa4a1)

```jsx
/* diff --git a/react-projects/2-tours/setup/src/App.js b/react-projects/2-tours/setup/src/App.js */
/* index 7bcbacf..8e2bdad 100644 */
/* --- a/react-projects/2-tours/setup/src/App.js */
/* +++ b/react-projects/2-tours/setup/src/App.js */
/* @@ -37,13 +37,24 @@ function App() { */
         <Loading />
       </main>
     )
//-  } else {
  }
  if (tours.length == 0) {
     return (
       <main>
//-        <Tours tours={tours} removeTour={removeTour} />
        <div className='title'>
          <h2>No Tours found</h2>
          <button className='btn' onClick={fetchTours}>
            Refresh
          </button>
        </div>
       </main>
     )
   }
  return (
    <main>
      <Tours tours={tours} removeTour={removeTour} />
    </main>
  )
 }
 
 export default App
```

## Reviews

### 96. Reviews - Intro

:key: [Setup Code for Reviews project](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/3-reviews)

:key: [Completed Reviews app](https://react-projects-3-reviews.netlify.app/)

`npm install`

### 97. Reviews - Info and React-Icons

:fire: Using https://react-icons.github.io/react-icons/

###### :boat: [Using react-icons with styling](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/71e3f14)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/App.js b/react-projects/3-reviews/setup/src/App.js */
/* index 536675a..528d16e 100644 */
/* --- a/react-projects/3-reviews/setup/src/App.js */
/* +++ b/react-projects/3-reviews/setup/src/App.js */
/* @@ -1,7 +1,14 @@ */
//-import React from 'react';
//-import Review from './Review';
import React from 'react'
import Review from './Review'
import { FaGit, FaGithubSquare } from 'react-icons/fa'

 function App() {
//-  return <h2>reviews project setup</h2>;
  return (
    <h2>
      reviews project setup
      <FaGithubSquare className='icon' />
    </h2>
  )
 }
 
//-export default App;
export default App
```

```css
/* diff --git a/react-projects/3-reviews/setup/src/index.css b/react-projects/3-reviews/setup/src/index.css */
/* index c8b78e6..731f8cd 100644 */
/* --- a/react-projects/3-reviews/setup/src/index.css */
/* +++ b/react-projects/3-reviews/setup/src/index.css */
/* @@ -250,3 +250,8 @@ main { */
   background: var(--clr-primary-5);
   color: var(--clr-primary-1);
 }

.icon {
  font-size: 4rem;
  color: red;
}
```

### 98. Reviews - Basic Setup

###### :boat: [Set up main page and include `<Review />`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/dfd3afa)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/App.js b/react-projects/3-reviews/setup/src/App.js */
/* index 528d16e..1be105f 100644 */
/* --- a/react-projects/3-reviews/setup/src/App.js */
/* +++ b/react-projects/3-reviews/setup/src/App.js */
/* @@ -4,10 +4,15 @@ import { FaGit, FaGithubSquare } from 'react-icons/fa' */
 
 function App() {
   return (
//-    <h2>
//-      reviews project setup
//-      <FaGithubSquare className='icon' />
//-    </h2>
    <main>
      <section className='container'>
        <div className='title'>
          <h2>our reviews</h2>
          <div className='underline'></div>
        </div>
        <Review />
      </section>
    </main>
   )
 }

```

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index ef68434..7e00bf5 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -1,9 +1,9 @@ */
//-import React, { useState } from 'react';
//-import people from './data';
//-import { FaChevronLeft, FaChevronRight, FaQuoteRight } from 'react-icons/fa';
import React, { useState } from 'react'
import people from './data'
import { FaChevronLeft, FaChevronRight, FaQuoteRight } from 'react-icons/fa'
 
 const Review = () => {
//-  return <h2>review component</h2>;
//-};
  return <h2>review component</h2>
}
 
//-export default Review;
export default Review
```

###### :boat: [using react-icons and local data source](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5df847a)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index 7e00bf5..5034204 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -1,6 +1,6 @@ */
 import React, { useState } from 'react'
//-import people from './data'
//-import { FaChevronLeft, FaChevronRight, FaQuoteRight } from 'react-icons/fa'
import people from './data' // data source instead of external api
import { FaChevronLeft, FaChevronRight, FaQuoteRight } from 'react-icons/fa' // icons
 
 const Review = () => {
   return <h2>review component</h2>
```

###### :boat: [Lets see whats in the `people` array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/749d2a7)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index 5034204..95fe943 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -3,6 +3,9 @@ import people from './data' // data source instead of external api */
 import { FaChevronLeft, FaChevronRight, FaQuoteRight } from 'react-icons/fa' // icons
 
 const Review = () => {
  const [index, setIndex] = useState(0)
  console.log(people)

   return <h2>review component</h2>
 }
```

###### :boat: [show our first review](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/f3206b8)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index 95fe943..9363321 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -1,12 +1,18 @@ */
 import React, { useState } from 'react'
//-import people from './data' // data source instead of external api
import people from './data' // `people` data source instead of external api
 import { FaChevronLeft, FaChevronRight, FaQuoteRight } from 'react-icons/fa' // icons
 
 const Review = () => {
   const [index, setIndex] = useState(0)
//-  console.log(people)
  const { name, job, image, text } = people[index] // access 0th element of people array
 
//-  return <h2>review component</h2>
  return (
    <article className='review'>
      <div className='img-container'>
        <img src={image} alt={name} className='person-img' />
      </div>
    </article>
  )
 }
 
 export default Review
```

###### :boat: [display a quote icon](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/c521a3f)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index 9363321..3e50709 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -10,6 +10,9 @@ const Review = () => { */
     <article className='review'>
       <div className='img-container'>
         <img src={image} alt={name} className='person-img' />
        <span className='quote-icon'>
          <FaQuoteRight />
        </span>
       </div>
     </article>
   )
```

###### :boat: [display name, job, text](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/31de397)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index 3e50709..cb7b4b9 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -14,6 +14,9 @@ const Review = () => { */
           <FaQuoteRight />
         </span>
       </div>
      <h4 className='author'>{name}</h4>
      <p className='job'>{job}</p>
      <p className='info'>{text}</p>
     </article>
   )
 }
```

###### :boat: [Create our prev, next, random buttons](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5c8bb75)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index cb7b4b9..8b829e0 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -17,6 +17,15 @@ const Review = () => { */
       <h4 className='author'>{name}</h4>
       <p className='job'>{job}</p>
       <p className='info'>{text}</p>
      <div className='button-container'>
        <button className='prev-btn'>
          <FaChevronLeft />
        </button>
        <button className='next-btn'>
          <FaChevronRight />
        </button>
      </div>
      <button className='random-btn'>surprise me</button>
     </article>
   )
 }
```

### 99. Reviews - Prev and Next

###### :boat: [prev and next review functionality](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/bd5a8cf)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index 8b829e0..b24e3ca 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -6,6 +6,30 @@ const Review = () => { */
   const [index, setIndex] = useState(0)
   const { name, job, image, text } = people[index] // access 0th element of people array
 
  const checkNumber = (number) => {
    if (number > people.length - 1) {
      return 0
    }
    if (number < 0) {
      return people.length - 1
    }
    return number
  }

  const nextPerson = () => {
    setIndex((index) => {
      let newIndex = index + 1
      return checkNumber(newIndex)
    })
  }

  const prevPerson = () => {
    setIndex((index) => {
      let newIndex = index + 1
      return checkNumber(newIndex)
    })
  }

   return (
     <article className='review'>
       <div className='img-container'>
/* @@ -18,10 +42,10 @@ const Review = () => { */
       <p className='job'>{job}</p>
       <p className='info'>{text}</p>
       <div className='button-container'>
//-        <button className='prev-btn'>
        <button className='prev-btn' onClick={prevPerson}>
           <FaChevronLeft />
         </button>
//-        <button className='next-btn'>
        <button className='next-btn' onClick={nextPerson}>
           <FaChevronRight />
         </button>
       </div>
```

### 100. Reviews - Random

###### :boat: [Display a random review](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/84513bf)

```jsx
/* diff --git a/react-projects/3-reviews/setup/src/Review.js b/react-projects/3-reviews/setup/src/Review.js */
/* index b24e3ca..b2d1ab6 100644 */
/* --- a/react-projects/3-reviews/setup/src/Review.js */
/* +++ b/react-projects/3-reviews/setup/src/Review.js */
/* @@ -30,6 +30,18 @@ const Review = () => { */
     })
   }
 
  const randPerson = () => {
    setIndex((index) => {
      let rand = index
      console.log(`index = ${rand}`)
      do {
        rand = Math.floor(Math.random() * people.length)
      } while (rand === index)
      console.log(rand)
      return rand
    })
  }

   return (
     <article className='review'>
       <div className='img-container'>
/* @@ -49,7 +61,9 @@ const Review = () => { */
           <FaChevronRight />
         </button>
       </div>
//-      <button className='random-btn'>surprise me</button>
      <button className='random-btn' onClick={randPerson}>
        surprise me
      </button>
     </article>
   )
 }
```

## Accordian

### 101. Accordion - Intro

Functionality is to have expand/collapse sections

:key: [Setup Code for Accordion project](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/4-accordion)

:key: [Completed Reviews app](https://react-projects-4-accordion.netlify.app/)

`npm install`

### 102. Accordion - Complete

###### :boat: [data file](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1516f93)

```jsx
/* diff --git a/react-projects/4-accordion/setup/src/data.js b/react-projects/4-accordion/setup/src/data.js */
/* index 07564a6..142baa7 100644 */
/* --- a/react-projects/4-accordion/setup/src/data.js */
/* +++ b/react-projects/4-accordion/setup/src/data.js */
/* @@ -1,3 +1,4 @@ */
// data
 const questions = [
   {
     id: 1,
```

###### :boat: [Example changing css](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/3dd3859)

```jsx
/* diff --git a/react-projects/4-accordion/setup/src/App.js b/react-projects/4-accordion/setup/src/App.js */
/* index b40b768..5acd703 100644 */
/* --- a/react-projects/4-accordion/setup/src/App.js */
/* +++ b/react-projects/4-accordion/setup/src/App.js */
/* @@ -1,8 +1,9 @@ */
//-import React, { useState } from 'react';
//-import data from './data';
//-import SingleQuestion from './Question';
import React, { useState } from 'react'
import data from './data'
import SingleQuestion from './Question'

 function App() {
//-  return <h2>accordion project setup</h2>;
  return <h2>accordion project setup</h2>
 }
 
//-export default App;
export default App
```

```css
/* diff --git a/react-projects/4-accordion/setup/src/index.css b/react-projects/4-accordion/setup/src/index.css */
/* index 1a28544..e0a2f55 100644 */
/* --- a/react-projects/4-accordion/setup/src/index.css */
/* +++ b/react-projects/4-accordion/setup/src/index.css */
/* @@ -63,7 +63,7 @@ Global Styles */
 body {
   font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
     Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
//-  background: var(--clr-purple);
  background: var(--clr-green-light);
   color: var(--clr-grey-1);
   line-height: 1.5;
   font-size: 0.875rem;
```

###### :boat: [set up layout for our sections](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/dc9a1a7)

```jsx
/* diff --git a/react-projects/4-accordion/setup/src/App.js b/react-projects/4-accordion/setup/src/App.js */
/* index 5acd703..3dbecb6 100644 */
/* --- a/react-projects/4-accordion/setup/src/App.js */
/* +++ b/react-projects/4-accordion/setup/src/App.js */
/* @@ -3,7 +3,20 @@ import data from './data' */
 import SingleQuestion from './Question'
 
 function App() {
//-  return <h2>accordion project setup</h2>
  const [questions, setQuestions] = useState(data)

  return (
    <main>
      <div className='container'>
        <h3>questions and answers about login</h3>
        <section className='info'>
          {questions.map((question) => {
            return <SingleQuestion key={questions.id} {...question} />
          })}
        </section>
      </div>
    </main>
  )
 }
 
 export default App
```

###### :boat: [display `data` in `<Question...>` sections](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/53d4911)

```jsx
/* diff --git a/react-projects/4-accordion/setup/src/Question.js b/react-projects/4-accordion/setup/src/Question.js */
/* index 616de3b..1087af9 100644 */
/* --- a/react-projects/4-accordion/setup/src/Question.js */
/* +++ b/react-projects/4-accordion/setup/src/Question.js */
/* @@ -1,7 +1,16 @@ */
//-import React, { useState } from 'react';
//-import { AiOutlineMinus, AiOutlinePlus } from 'react-icons/ai';
//-const Question = () => {
//-  return <h2>question component</h2>;
//-};
import React, { useState } from 'react'
import { AiOutlineMinus, AiOutlinePlus } from 'react-icons/ai' // icons
 
//-export default Question;
const Question = ({ title, info }) => {
  return (
    <article className='question'>
      <header>
        <h4>{title}</h4>
        <button className='btn'>...</button>
      </header>
      <p>{info}</p>
    </article>
  )
}

export default Question
```

###### :boat: [default section to collapsed](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/58ab583)

```jsx
/* diff --git a/react-projects/4-accordion/setup/src/Question.js b/react-projects/4-accordion/setup/src/Question.js */
/* index 1087af9..e2eb90b 100644 */
/* --- a/react-projects/4-accordion/setup/src/Question.js */
/* +++ b/react-projects/4-accordion/setup/src/Question.js */
/* @@ -2,13 +2,14 @@ import React, { useState } from 'react' */
 import { AiOutlineMinus, AiOutlinePlus } from 'react-icons/ai' // icons
 
 const Question = ({ title, info }) => {
  const [showInfo, setShowInfo] = useState(false)
   return (
     <article className='question'>
       <header>
         <h4>{title}</h4>
//-        <button className='btn'>...</button>
        <button className='btn'>+</button>
       </header>
//-      <p>{info}</p>
      {showInfo && <p>{info}</p>}
     </article>
   )
 }
```

###### :boat: [expand/collapse sections](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/3a25e38)

```jsx
/* diff --git a/react-projects/4-accordion/setup/src/Question.js b/react-projects/4-accordion/setup/src/Question.js */
/* index e2eb90b..a44bd61 100644 */
/* --- a/react-projects/4-accordion/setup/src/Question.js */
/* +++ b/react-projects/4-accordion/setup/src/Question.js */
/* @@ -7,7 +7,9 @@ const Question = ({ title, info }) => { */
     <article className='question'>
       <header>
         <h4>{title}</h4>
//-        <button className='btn'>+</button>
        <button className='btn' onClick={() => setShowInfo(!showInfo)}>
          {showInfo ? <AiOutlineMinus /> : <AiOutlinePlus />}
        </button>
       </header>
       {showInfo && <p>{info}</p>}
     </article>
```

## Menu

### 103. Menu - Intro

Filter a menu

:key: [Completed Reviews app](https://react-projects-5-menu.netlify.app/)

:key: [Setup Code for Menu project](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/5-menu)

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5e34382)

### 104. Menu - Display Items

###### :boat: [data.js](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b62b9fa)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/data.js b/react-projects/5-menu/setup/src/data.js */
/* index 773d1f2..3ff1089 100644 */
/* --- a/react-projects/5-menu/setup/src/data.js */
/* +++ b/react-projects/5-menu/setup/src/data.js */
/* @@ -1,3 +1,4 @@ */
// data.js
 const menu = [
   {
     id: 1,
/* @@ -71,5 +72,5 @@ const menu = [ */
     img: './images/item-9.jpeg',
     desc: `skateboard fam synth authentic semiotics. Live-edge lyft af, edison bulb yuccie crucifix microdosing.`,
   },
//-];
//-export default menu;
]
export default menu
```

###### :boat: [import data and set up in our state](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4fadc8e)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index 05dc885..2ffea44 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -1,10 +1,11 @@ */
//-import React, { useState } from 'react';
//-import Menu from './Menu';
//-import Categories from './Categories';
//-import items from './data';
import React, { useState } from 'react'
import Menu from './Menu'
import Categories from './Categories'
import items from './data'
 
 function App() {
//-  return <h2>menu project setup</h2>;
  const [menuItems, setMenuItems] = useState(items)
  return <h2>menu project setup</h2>
 }
 
//-export default App;
export default App
```

###### :boat: [header](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1ee3e0f)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index 2ffea44..eb9be88 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -5,7 +5,18 @@ import items from './data' */
 
 function App() {
   const [menuItems, setMenuItems] = useState(items)
//-  return <h2>menu project setup</h2>
  const [categories, setCategories] = useState([])

  return (
    <main>
      <section className='menu section'>
        <div className='title'>
          <h2>our menu</h2>
          <div className='underline'></div>
        </div>
      </section>
    </main>
  )
 }
 
 export default App
```

###### :boat: [Pass `menuItems` to `<Menu />`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d98febe)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index eb9be88..a769282 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -14,6 +14,8 @@ function App() { */
           <h2>our menu</h2>
           <div className='underline'></div>
         </div>
        <Categories />
        <Menu items={menuItems} />
       </section>
     </main>
   )
```

###### :boat: [Display menu item details](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b55aea8)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/Menu.js b/react-projects/5-menu/setup/src/Menu.js */
/* index 07bb31a..4ce4503 100644 */
/* --- a/react-projects/5-menu/setup/src/Menu.js */
/* +++ b/react-projects/5-menu/setup/src/Menu.js */
/* @@ -1,7 +1,26 @@ */
//-import React from 'react';
import React from 'react'
 
//-const Menu = () => {
//-  return <h2>menu component</h2>;
//-};
const Menu = ({ items }) => {
  return (
    <div className='section-center'>
      {items.map((menuItem) => {
        const { id, title, img, desc, price } = menuItem
 
//-export default Menu;
        return (
          <article className='menu-item' key={id}>
            <img src={img} alt={title} className='photo' />
            <div className='item-info'>
              <header>
                <h4>{title}</h4>
                <h4 className='price'>{price}</h4>
              </header>
              <p className='item-text'>{desc}</p>
            </div>
          </article>
        )
      })}
    </div>
  )
}

export default Menu
```

### 105. Menu - Buttons (manual approach)

:imp: This approach isn't ideal, but useful to practice

###### :boat: [Our first filter by breakfast](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/a5d1224)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index a769282..11f7b83 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -7,6 +7,11 @@ function App() { */
   const [menuItems, setMenuItems] = useState(items)
   const [categories, setCategories] = useState([])
 
  const filterItems = (category) => {
    const newItems = items.filter((item) => item.category === category)
    setMenuItems(newItems)
  }

   return (
     <main>
       <section className='menu section'>
/* @@ -14,7 +19,7 @@ function App() { */
           <h2>our menu</h2>
           <div className='underline'></div>
         </div>
//-        <Categories />
        <Categories filterItems={filterItems} />
         <Menu items={menuItems} />
       </section>
     </main>
```

```jsx
/* diff --git a/react-projects/5-menu/setup/src/Categories.js b/react-projects/5-menu/setup/src/Categories.js */
/* index 97483b6..57ddea2 100644 */
/* --- a/react-projects/5-menu/setup/src/Categories.js */
/* +++ b/react-projects/5-menu/setup/src/Categories.js */
/* @@ -1,7 +1,13 @@ */
//-import React from 'react';
import React from 'react'
 
//-const Categories = () => {
//-  return <h2>categories component</h2>;
//-};
const Categories = ({ filterItems }) => {
  return (
    <div className='btn-container'>
      <button className='filter-btn' onClick={() => filterItems('breakfast')}>
        breakfast
      </button>
    </div>
  )
}
 
//-export default Categories;
export default Categories
```

###### :boat: [Provide an `All` menu filter](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/2a6f314)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index 11f7b83..eb77e04 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -8,6 +8,10 @@ function App() { */
   const [categories, setCategories] = useState([])
 
   const filterItems = (category) => {
    if (category === 'all') {
      setMenuItems(items)
      return
    }
     const newItems = items.filter((item) => item.category === category)
     setMenuItems(newItems)
   }
```

```jsx
/* diff --git a/react-projects/5-menu/setup/src/Categories.js b/react-projects/5-menu/setup/src/Categories.js */
/* index 57ddea2..9ffac7c 100644 */
/* --- a/react-projects/5-menu/setup/src/Categories.js */
/* +++ b/react-projects/5-menu/setup/src/Categories.js */
/* @@ -3,6 +3,9 @@ import React from 'react' */
 const Categories = ({ filterItems }) => {
   return (
     <div className='btn-container'>
      <button className='filter-btn' onClick={() => filterItems('all')}>
        All
      </button>
       <button className='filter-btn' onClick={() => filterItems('breakfast')}>
         breakfast
       </button>
```

### 106. Menu - "all" Button

:imp: If we get new categories, we would have to manually add them to the filters :sad:

###### :boat: [map over items and return **unique** categories](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/e340849)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index eb77e04..272302c 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -3,6 +3,9 @@ import Menu from './Menu' */
 import Categories from './Categories'
 import items from './data'
 
const allCategories = ['all', ...new Set(items.map((item) => item.category))]
console.log(allCategories)

 function App() {
   const [menuItems, setMenuItems] = useState(items)
   const [categories, setCategories] = useState([])
```

### 107. Menu - Categories Buttons (dynamic approach)

###### :boat: [Dynamic categories](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9e61275)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/App.js b/react-projects/5-menu/setup/src/App.js */
/* index 272302c..2686e41 100644 */
/* --- a/react-projects/5-menu/setup/src/App.js */
/* +++ b/react-projects/5-menu/setup/src/App.js */
/* @@ -4,11 +4,10 @@ import Categories from './Categories' */
 import items from './data'
 
 const allCategories = ['all', ...new Set(items.map((item) => item.category))]
//-console.log(allCategories)
 
 function App() {
   const [menuItems, setMenuItems] = useState(items)
//-  const [categories, setCategories] = useState([])
  const [categories, setCategories] = useState(allCategories)
 
   const filterItems = (category) => {
     if (category === 'all') {
/* @@ -26,7 +25,7 @@ function App() { */
           <h2>our menu</h2>
           <div className='underline'></div>
         </div>
//-        <Categories filterItems={filterItems} />
        <Categories categories={categories} filterItems={filterItems} />
         <Menu items={menuItems} />
       </section>
     </main>
```

```jsx
/* diff --git a/react-projects/5-menu/setup/src/Categories.js b/react-projects/5-menu/setup/src/Categories.js */
/* index 9ffac7c..0866842 100644 */
/* --- a/react-projects/5-menu/setup/src/Categories.js */
/* +++ b/react-projects/5-menu/setup/src/Categories.js */
/* @@ -1,14 +1,20 @@ */
 import React from 'react'
 
//-const Categories = ({ filterItems }) => {
const Categories = ({ categories, filterItems }) => {
   return (
     <div className='btn-container'>
//-      <button className='filter-btn' onClick={() => filterItems('all')}>
//-        All
//-      </button>
//-      <button className='filter-btn' onClick={() => filterItems('breakfast')}>
//-        breakfast
//-      </button>
      {categories.map((category, index) => {
        return (
          <button
            type='button'
            className='filter-btn'
            key={index}
            onClick={() => filterItems(category)}
          >
            {category}
          </button>
        )
      })}
     </div>
   )
 }
```

###### :boat: [Test dynamically adding a new category](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/80c94b8)

```jsx
/* diff --git a/react-projects/5-menu/setup/src/data.js b/react-projects/5-menu/setup/src/data.js */
/* index 3ff1089..0b8ec89 100644 */
/* --- a/react-projects/5-menu/setup/src/data.js */
/* +++ b/react-projects/5-menu/setup/src/data.js */
/* @@ -72,5 +72,13 @@ const menu = [ */
     img: './images/item-9.jpeg',
     desc: `skateboard fam synth authentic semiotics. Live-edge lyft af, edison bulb yuccie crucifix microdosing.`,
   },
  {
    id: 10,
    title: 'buddy buddy',
    category: 'slurpy',
    price: 16.99,
    img: './images/item-9.jpeg',
    desc: `skateboard fam synth authentic semiotics. Live-edge lyft af, edison bulb yuccie crucifix microdosing.`,
  },
 ]
 export default menu
```

## Tabs

### 108. Tabs - Intro

Display a section of content based on menu selection

:key: [Completed Reviews app](https://react-projects-6-tabs.netlify.app/)

:key: [Setup Code for Tabs project](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/5-tabs)

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b33a858)

### 109. Tabs - Fetch Jobs

###### :boat: [Fetch jobs from API](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1252e98)

```jsx
/* diff --git a/react-projects/6-tabs/setup/src/App.js b/react-projects/6-tabs/setup/src/App.js */
/* index 5502c20..50524d3 100644 */
/* --- a/react-projects/6-tabs/setup/src/App.js */
/* +++ b/react-projects/6-tabs/setup/src/App.js */
/* @@ -3,8 +3,31 @@ import { FaAngleDoubleRight } from 'react-icons/fa' */
 // ATTENTION!!!!!!!!!!
 // I SWITCHED TO PERMANENT DOMAIN
 const url = 'https://course-api.com/react-tabs-project'

 function App() {
//-  return <h2>tabs project setup</h2>
  const [loading, setLoading] = useState(true)
  const [jobs, setJobs] = useState([])
  const [value, setValue] = useState(0)

  const fetchJobs = async () => {
    const response = await fetch(url)
    const newJobs = await response.json()
    setJobs(newJobs)
    setLoading(false)
  }

  useEffect(() => {
    fetchJobs()
  }, [])

  if (loading) {
    return (
      <section className='section loading'>
        <h1>loading...</h1>
      </section>
    )
  }
  return <h2>jobs</h2>
 }
 
 export default App
```

### 110. Tabs - Display First Job

###### :warning: :boat: [Display first profile](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1fcd416)

### 111. Tabs - Display Buttons

###### :boat: [Display the sidebar menu](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9286b86)

```jsx
/* diff --git a/react-projects/6-tabs/setup/src/App.js b/react-projects/6-tabs/setup/src/App.js */
/* index 0241102..0250f18 100644 */
/* --- a/react-projects/6-tabs/setup/src/App.js */
/* +++ b/react-projects/6-tabs/setup/src/App.js */
/* @@ -36,6 +36,19 @@ function App() { */
       </div>
       <div className='jobs-center'>
         {/* btn container */}
        <div className='btn-container'>
          {jobs.map((job, index) => {
            return (
              <button
                key={job.id}
                onClick={() => setValue(index)}
                className={`job-btn ${index === value && 'active-btn'}`}
              >
                {job.company}
              </button>
            )
          })}
        </div>
         {/* job info */}
         <article className='job-info'>
           <h3>{title}</h3>
```

## Slider

### 112. Slider - Intro

Display content in a slider (prev/next) with a random timer to autoscroll

:key: [Completed Reviews app](https://react-projects-7-slider.netlify.app/)

:key: [Setup Code for Menu project](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/7-slider)

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/50836ad)

### 113. Slider - Setup

###### :boat: [Basic page setup](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/c6d142a)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index 341ca3c..fd8a70b 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -1,9 +1,42 @@ */
//-import React, { useState, useEffect } from 'react';
//-import { FiChevronRight, FiChevronLeft } from 'react-icons/fi';
//-import { FaQuoteRight } from 'react-icons/fa';
//-import data from './data';
import React, { useState, useEffect } from 'react'
import { FiChevronRight, FiChevronLeft } from 'react-icons/fi'
import { FaQuoteRight } from 'react-icons/fa'
import data from './data'
 function App() {
//-  return <h2>slider project setup</h2>;
  const [people, setPeople] = useState(data)
  const [index, setIndex] = useState(0)

  useEffect(() => {}, [])

  return (
    <section className='section'>
      <div className='title'>
        <h2>
          <span>/</span>reviews
        </h2>
      </div>
      <div className='section-center'>
        {people.map((person, personIndex) => {
          const { id, image, name, title, quote } = person
          return (
            <article key={id}>
              <img src={image} alt={name} className='person-img' />
              <h4>{name}</h4>
              <p className='title'>{title}</p>
              <p className='text'>{quote}</p>
              <FaQuoteRight className='icon' />
            </article>
          )
        })}
        <button className='prev'>
          <FiChevronLeft />
        </button>
        <button className='next'>
          <FiChevronRight />
        </button>
      </div>
    </section>
  )
 }
 
//-export default App;
export default App
```

### 114. Slider - CSS Overview

`article` has css with `position: absolute...` which makes all the "slides" layer on top of each other
* look at `article.activeSlide`, `article.lastSlide`, and `article.nextSlide` to enable "slide" functionality

###### :boat: [enable necessary css](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/39158ea)

```css
/* diff --git a/react-projects/7-slider/setup/src/index.css b/react-projects/7-slider/setup/src/index.css */
/* index 42e9921..4743248 100644 */
/* --- a/react-projects/7-slider/setup/src/index.css */
/* +++ b/react-projects/7-slider/setup/src/index.css */
/* @@ -156,13 +156,12 @@ Slider */
   margin: 0 auto;
   margin-top: 4rem;
   width: 80vw;
//-  /* have to have a height */
//-  height: 450px;
  height: 450px; /* have to have a height */
   max-width: 800px;
   text-align: center;
   position: relative;
   display: flex;
//-  /* overflow: hidden; */
  overflow: hidden;
 }
 .person-img {
   border-radius: 50%;
/* @@ -239,10 +238,10 @@ article { */
   left: 0;
   width: 100%;
   height: 100%;
//-  /* opacity: 0; */
  opacity: 0;
   transition: var(--transition);
 }
//-/* article.activeSlide {
article.activeSlide {
   opacity: 1;
   transform: translateX(0);
 }
/* @@ -251,4 +250,4 @@ article.lastSlide { */
 }
 article.nextSlide {
   transform: translateX(100%);
//-} */
}
```

### 115. Slider - Setup Classes

###### :boat: [Set up active, last, and next Slides](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/55691ab)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index fd8a70b..bf7e990 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -18,8 +18,20 @@ function App() { */
       <div className='section-center'>
         {people.map((person, personIndex) => {
           const { id, image, name, title, quote } = person

          let position = 'nextSlide'
          if (personIndex === index) {
            position = 'activeSlide'
          }
          if (
            personIndex === index - 1 ||
            (index === 0 && personIndex === people.length - 1)
          ) {
            position = 'lastSlide'
          }

           return (
//-            <article key={id}>
            <article key={id} className={position}>
               <img src={image} alt={name} className='person-img' />
               <h4>{name}</h4>
               <p className='title'>{title}</p>
```

```css
/* diff --git a/react-projects/7-slider/setup/src/index.css b/react-projects/7-slider/setup/src/index.css */
/* index 4743248..316d967 100644 */
/* --- a/react-projects/7-slider/setup/src/index.css */
/* +++ b/react-projects/7-slider/setup/src/index.css */
/* @@ -161,7 +161,7 @@ Slider */
   text-align: center;
   position: relative;
   display: flex;
//-  overflow: hidden;
  overflow: visible; /* while testing, show .lastSlide and .nextSlide */
 }
 .person-img {
   border-radius: 50%;
/* @@ -238,7 +238,7 @@ article { */
   left: 0;
   width: 100%;
   height: 100%;
//-  opacity: 0;
  /* opacity: 0; */
   transition: var(--transition);
 }
 article.activeSlide {
```

### 116. Slider - Prev and Next Buttons

###### :boat: [prev and next functionality](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/99d91d8)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index bf7e990..02b1530 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -40,10 +40,20 @@ function App() { */
             </article>
           )
         })}
//-        <button className='prev'>
        <button
          className='prev'
          onClick={() => {
            index === 0 ? setIndex(people.length - 1) : setIndex(index - 1)
          }}
        >
           <FiChevronLeft />
         </button>
//-        <button className='next'>
        <button
          className='next'
          onClick={() => {
            index === people.length - 1 ? setIndex(0) : setIndex(index + 1)
          }}
        >
           <FiChevronRight />
         </button>
       </div>
```

###### :boat: [hide lastSlide and nextSlide with `overflow: hidden`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/45cd257)

```css
/* diff --git a/react-projects/7-slider/setup/src/index.css b/react-projects/7-slider/setup/src/index.css */
/* index 316d967..c60cc2d 100644 */
/* --- a/react-projects/7-slider/setup/src/index.css */
/* +++ b/react-projects/7-slider/setup/src/index.css */
/* @@ -161,7 +161,7 @@ Slider */
   text-align: center;
   position: relative;
   display: flex;
//-  overflow: visible; /* while testing, show .lastSlide and .nextSlide */
  overflow: hidden; /* hide .lastSlide and .nextSlide. Only show .activeSlide */
 }
 .person-img {
   border-radius: 50%;
```

###### :boat: [`useEffect` to check index overflow](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/fbefaad)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index 02b1530..4208f11 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -6,7 +6,12 @@ function App() { */
   const [people, setPeople] = useState(data)
   const [index, setIndex] = useState(0)
 
//-  useEffect(() => {}, [])
  useEffect(() => {
    const lastIndex = people.length - 1

    if (index < 0) setIndex(lastIndex)
    if (index > lastIndex) setIndex(0)
  }, [index, people]) // We want to update the useEffect if people changes
 
   return (
     <section className='section'>
/* @@ -40,20 +45,10 @@ function App() { */
             </article>
           )
         })}
//-        <button
//-          className='prev'
//-          onClick={() => {
//-            index === 0 ? setIndex(people.length - 1) : setIndex(index - 1)
//-          }}
//-        >
        <button className='prev' onClick={() => setIndex(index - 1)}>
           <FiChevronLeft />
         </button>
//-        <button
//-          className='next'
//-          onClick={() => {
//-            index === people.length - 1 ? setIndex(0) : setIndex(index + 1)
//-          }}
//-        >
        <button className='next' onClick={() => setIndex(index + 1)}>
           <FiChevronRight />
         </button>
       </div>
```

### 117. Slider - Autoplay

###### :boat: [scroll the slider on a timer](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/040764d)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index 4208f11..4e5e0b9 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -13,6 +13,12 @@ function App() { */
     if (index > lastIndex) setIndex(0)
   }, [index, people]) // We want to update the useEffect if people changes
 
  useEffect(() => {
    let slider = setInterval(() => {
      setIndex(index + 1)
    }, 3000)
  }, [index])

   return (
     <section className='section'>
       <div className='title'>
```

###### :boat: [:mega: Have to clean up the interval timer or they start piling on the stack](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/8629ccb)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index 4e5e0b9..8388c37 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -17,6 +17,10 @@ function App() { */
     let slider = setInterval(() => {
       setIndex(index + 1)
     }, 3000)

    return () => {
      clearInterval(slider)
    }
   }, [index])
 
   return (
```

### 118. Slider - Alternative

###### :boat: [Alternative to `useEffect` is to create a function to slide the index](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d7d2dfe)

```jsx
/* diff --git a/react-projects/7-slider/setup/src/App.js b/react-projects/7-slider/setup/src/App.js */
/* index 8388c37..c756134 100644 */
/* --- a/react-projects/7-slider/setup/src/App.js */
/* +++ b/react-projects/7-slider/setup/src/App.js */
/* @@ -6,16 +6,24 @@ function App() { */
   const [people, setPeople] = useState(data)
   const [index, setIndex] = useState(0)
 
//-  useEffect(() => {
//-    const lastIndex = people.length - 1
-
//-    if (index < 0) setIndex(lastIndex)
//-    if (index > lastIndex) setIndex(0)
//-  }, [index, people]) // We want to update the useEffect if people changes
  const prevSlide = () => {
    setIndex((oldIndex) => {
      let index = oldIndex - 1
      if (index < 0) index = people.length - 1
      return index
    })
  }
  const nextSlide = () => {
    setIndex((oldIndex) => {
      let index = oldIndex + 1
      if (index > people.length - 1) index = 0
      return index
    })
  }
 
   useEffect(() => {
     let slider = setInterval(() => {
//-      setIndex(index + 1)
      nextSlide()
     }, 3000)
 
     return () => {
/* @@ -55,10 +63,10 @@ function App() { */
             </article>
           )
         })}
//-        <button className='prev' onClick={() => setIndex(index - 1)}>
        <button className='prev' onClick={prevSlide}>
           <FiChevronLeft />
         </button>
//-        <button className='next' onClick={() => setIndex(index + 1)}>
        <button className='next' onClick={nextSlide}>
           <FiChevronRight />
         </button>
       </div>
```

## Lorem Ipsum

### 119. Lorem Ipsum - Intro

Generate random text, ala lorem-ipsum, for as many paragraphs as you need

:key: [Completed Lorem Ipsum](https://react-projects-8-lorem-ipsum-generator.netlify.app/)

:key: [Setup Code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/react-projects/8-lorem-ipsum)

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/cdeb5fa)

### 120. Lorem Ipsum - Structure

###### :boat: [Skeleton state and form](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/5f844ac)

```jsx
/* diff --git a/react-projects/8-lorem-ipsum/setup/src/App.js b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* index 06cbb07..0a0e07d 100644 */
/* --- a/react-projects/8-lorem-ipsum/setup/src/App.js */
/* +++ b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* @@ -1,7 +1,22 @@ */
 import React, { useState } from 'react'
 import data from './data' // data file

 function App() {
//-  return <h2>lorem ipsum project setup</h2>
  const [count, setCount] = useState(0)
  const [text, setText] = useState([])

  const handleSubmit = (e) => {
    e.preventDefault()
    console.log(e)
  }

  return (
    <section className='section-center'>
      <h3>Tired of boring lorem ipsum?</h3>

      <form className='lorem-form' onSubmit={handleSubmit}></form>
    </section>
  )
 }
 
 export default App
```

###### :boat: [paragraphs count input](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/1ded8e2)

```jsx
/* diff --git a/react-projects/8-lorem-ipsum/setup/src/App.js b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* index 0a0e07d..2268244 100644 */
/* --- a/react-projects/8-lorem-ipsum/setup/src/App.js */
/* +++ b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* @@ -14,7 +14,19 @@ function App() { */
     <section className='section-center'>
       <h3>Tired of boring lorem ipsum?</h3>
 
//-      <form className='lorem-form' onSubmit={handleSubmit}></form>
      <form className='lorem-form' onSubmit={handleSubmit}>
        <label htmlFor='amount'>paragraphs:</label>
        <input
          type='number'
          name='amount'
          id='amount'
          value={count}
          onChange={(e) => setCount(e.target.value)}
        />
        <button type='submit' className='btn'>
          Generate
        </button>
      </form>
     </section>
   )
 }
```

###### :boat: [placeholder for generated text](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/a12cc35)

```jsx
/* diff --git a/react-projects/8-lorem-ipsum/setup/src/App.js b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* index 2268244..67120f8 100644 */
/* --- a/react-projects/8-lorem-ipsum/setup/src/App.js */
/* +++ b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* @@ -27,6 +27,10 @@ function App() { */
           Generate
         </button>
       </form>
      <article className='lorem-text'>
        <p>lorem ipsum</p>
        <p>lorem caspasium</p>
      </article>
     </section>
   )
 }
```

###### :boat: [display all text in data on form submit](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/3b9502f)

```jsx
/* diff --git a/react-projects/8-lorem-ipsum/setup/src/App.js b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* index 67120f8..86e2539 100644 */
/* --- a/react-projects/8-lorem-ipsum/setup/src/App.js */
/* +++ b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* @@ -7,7 +7,7 @@ function App() { */
 
   const handleSubmit = (e) => {
     e.preventDefault()
//-    console.log(e)
    setText(data)
   }
 
   return (
/* @@ -28,8 +28,9 @@ function App() { */
         </button>
       </form>
       <article className='lorem-text'>
//-        <p>lorem ipsum</p>
//-        <p>lorem caspasium</p>
        {text.map((item, index) => {
          return <p key={index}>{item}</p>
        })}
       </article>
     </section>
   )
```

### 121. Lorem Ipsum - Complete

###### :boat: [:imp: Even though the form field is `type=number`, the returned value is string](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/7ed015a)

```jsx
/* diff --git a/react-projects/8-lorem-ipsum/setup/src/App.js b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* index 86e2539..4935645 100644 */
/* --- a/react-projects/8-lorem-ipsum/setup/src/App.js */
/* +++ b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* @@ -7,6 +7,7 @@ function App() { */
 
   const handleSubmit = (e) => {
     e.preventDefault()
    console.log(typeof count)
     setText(data)
   }
```

###### :boat: [check the size of `amount` input and limit to size of data array](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/cf1f3e3)

```jsx
/* diff --git a/react-projects/8-lorem-ipsum/setup/src/App.js b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* index 4935645..36a8d75 100644 */
/* --- a/react-projects/8-lorem-ipsum/setup/src/App.js */
/* +++ b/react-projects/8-lorem-ipsum/setup/src/App.js */
/* @@ -7,8 +7,10 @@ function App() { */
 
   const handleSubmit = (e) => {
     e.preventDefault()
//-    console.log(typeof count)
//-    setText(data)
    let amount = parseInt(count)
    if (amount < 1) amount = 1
    if (amount > text.size) amount = text.size - 1
    setText(data.slice(0, amount))
   }
 
   return (
```

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/0e9741f)

## Color Generator 

### 122. Color Generator - Intro

Given a color, generate a color palete to show different **tints and shades**/
* include error handler for invalid inpu
* functionality to copy to clipboard on click

Using [GitHub - noeldelgado/values.js: Get the tints and shades of a color](https://github.com/noeldelgado/values.js)

:key: [Color Generator Complete](https://react-projects-9-color-generator.netlify.app/)

:key: [Setup Code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/react-projects/9-color-generator)

### 123. Color Generator - Structure

###### :boat: [Set up input form to enter colors to tint/shade](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b7b0ade)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index 6afeb5c..907762a 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -4,7 +4,35 @@ import SingleColor from './SingleColor' */
 import Values from 'values.js'
 
 function App() {
//-  return <h2>color generator project</h2>
  const [color, setColor] = useState('')
  const [error, setError] = useState(false)
  const [list, setList] = useState([])

  const handleSubmit = (e) => {
    e.preventDefault()
    console.log(e.target.name, e.target.value)
  }
  return (
    <>
      <section className='container'>
        <h3>color generator</h3>
        <form onSubmit={handleSubmit}>
          <input
            type='text'
            value={color}
            onChange={(e) => setColor(e.target.value)}
            placeholder='#f15025'
          />
          <button className='btn' type='submit'>
            submit
          </button>
        </form>
      </section>
      <section className='colors'>
        <h4>list goes here</h4>
      </section>
    </>
  )
 }
 
 export default App
```

### 124. Color Generator - Color Values and Error

###### :boat: [Generate tint/shade for inputted color (see in `console.log`)](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/4fe98a1)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index 907762a..a244b22 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -4,13 +4,15 @@ import SingleColor from './SingleColor' */
 import Values from 'values.js'
 
 function App() {
//-  const [color, setColor] = useState('')
  const defaultColor = '#f15025'
  const [color, setColor] = useState(defaultColor)
   const [error, setError] = useState(false)
   const [list, setList] = useState([])
 
   const handleSubmit = (e) => {
     e.preventDefault()
//-    console.log(e.target.name, e.target.value)
    let colors = new Values(color).all(10)
    console.log(colors)
   }
   return (
     <>
/* @@ -21,7 +23,7 @@ function App() { */
             type='text'
             value={color}
             onChange={(e) => setColor(e.target.value)}
//-            placeholder='#f15025'
            placeholder={defaultColor}
           />
           <button className='btn' type='submit'>
             submit
```

###### :boat: [highlight input if invalid color is entered](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d563dfc)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index a244b22..2d72f56 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -11,8 +11,13 @@ function App() { */
 
   const handleSubmit = (e) => {
     e.preventDefault()
//-    let colors = new Values(color).all(10)
//-    console.log(colors)
    try {
      setError(false)
      let colors = new Values(color).all(10)
    } catch (error) {
      setError(true)
      console.log(error.message)
    }
   }
   return (
     <>
/* @@ -24,6 +29,7 @@ function App() { */
             value={color}
             onChange={(e) => setColor(e.target.value)}
             placeholder={defaultColor}
            className={`${error ? 'error' : null}`}
           />
           <button className='btn' type='submit'>
             submit
```

### 125. Color Generator - Single Color

###### :boat: [Pass `Values` to `<Singlecolor >`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/be09337)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index 2d72f56..106f16f 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -14,6 +14,7 @@ function App() { */
     try {
       setError(false)
       let colors = new Values(color).all(10)
      setList(colors)
     } catch (error) {
       setError(true)
       console.log(error.message)
/* @@ -37,7 +38,9 @@ function App() { */
         </form>
       </section>
       <section className='colors'>
//-        <h4>list goes here</h4>
        {list.map((color, index) => {
          return <SingleColor key={index} {...color} index={index} />
        })}
       </section>
     </>
   )
```

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/SingleColor.js b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* index e2cf300..984dfd3 100644 */
/* --- a/react-projects/9-color-generator/setup/src/SingleColor.js */
/* +++ b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* @@ -1,7 +1,8 @@ */
 import React, { useState, useEffect } from 'react'
 import rgbToHex from './utils'
 
//-const SingleColor = () => {
const SingleColor = ({ rgb, weight, index }) => {
  console.log(index, weight, rgb)
   return <h4>single color</h4>
 }
```

###### :boat: [Display palette for color](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d67a12b)

{% raw %}
```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/SingleColor.js b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* index 984dfd3..f6e9fd7 100644 */
/* --- a/react-projects/9-color-generator/setup/src/SingleColor.js */
/* +++ b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* @@ -2,8 +2,16 @@ import React, { useState, useEffect } from 'react' */
 import rgbToHex from './utils'
 
 const SingleColor = ({ rgb, weight, index }) => {
//-  console.log(index, weight, rgb)
//-  return <h4>single color</h4>
  const [alert, setalert] = useState(false)
  const bcg = rgb.join(',')
  const hex = rgbToHex(...rgb)

  return (
    <article className={`color`} style={{ backgroundColor: `rgb(${bcg})` }}>
      <p className='percent-value'>{weight}%</p>
      <p className='color-value'>{hex}</p>
    </article>
  )
 }
 
 export default SingleColor
```
{% endraw %}

###### :boat: [We can also get the `hex` value from `Values`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/61817b6)

{% raw %}
```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index 106f16f..90bb3b1 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -39,7 +39,10 @@ function App() { */
       </section>
       <section className='colors'>
         {list.map((color, index) => {
//-          return <SingleColor key={index} {...color} index={index} />
          console.log(color.hex)
          return (
            <SingleColor key={index} {...color} index={index} hex={color.hex} />
          )
         })}
       </section>
     </>
```
{% endraw %}

{% raw %}
```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/SingleColor.js b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* index f6e9fd7..4a5f8fa 100644 */
/* --- a/react-projects/9-color-generator/setup/src/SingleColor.js */
/* +++ b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* @@ -1,10 +1,9 @@ */
 import React, { useState, useEffect } from 'react'
 import rgbToHex from './utils'
 
//-const SingleColor = ({ rgb, weight, index }) => {
const SingleColor = ({ rgb, weight, hex, index }) => {
   const [alert, setalert] = useState(false)
   const bcg = rgb.join(',')
//-  const hex = rgbToHex(...rgb)
 
   return (
     <article className={`color`} style={{ backgroundColor: `rgb(${bcg})` }}>
```
{% endraw %}

### 126. Color Generator - Copy To Clipboard

###### :boat: [Copy to clipboard with `Navigator.clipboard`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/9c9d8d4)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index 90bb3b1..18e4025 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -39,7 +39,7 @@ function App() { */
       </section>
       <section className='colors'>
         {list.map((color, index) => {
//-          console.log(color.hex)
          console.log(color)
           return (
             <SingleColor key={index} {...color} index={index} hex={color.hex} />
           )
```

{% raw %}
```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/SingleColor.js b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* index 4a5f8fa..07cdd83 100644 */
/* --- a/react-projects/9-color-generator/setup/src/SingleColor.js */
/* +++ b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* @@ -4,11 +4,24 @@ import rgbToHex from './utils' */
 const SingleColor = ({ rgb, weight, hex, index }) => {
   const [alert, setalert] = useState(false)
   const bcg = rgb.join(',')
  const hexValue = `#${hex}`

  const copyToClipboard = (e) => {
    setalert(true)
    console.log(navigator)
    // https://developer.mozilla.org/en-US/docs/Web/API/Navigator/clipboard
    navigator.clipboard.writeText(hexValue)
  }
 
   return (
//-    <article className={`color`} style={{ backgroundColor: `rgb(${bcg})` }}>
    <article
      className={`color ${index > 10 && 'color-light'}`}
      style={{ backgroundColor: `rgb(${bcg})` }}
      onClick={copyToClipboard}
    >
       <p className='percent-value'>{weight}%</p>
//-      <p className='color-value'>{hex}</p>
      <p className='color-value'>{hexValue}</p>
      {alert && <p className='alert'>copied to clipboard</p>}
     </article>
   )
 }
```
{% endraw %}

###### :boat: [Clear out "copied to clipboard" after 3 seconds](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/6e3da3f)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/SingleColor.js b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* index 07cdd83..e9ea91b 100644 */
/* --- a/react-projects/9-color-generator/setup/src/SingleColor.js */
/* +++ b/react-projects/9-color-generator/setup/src/SingleColor.js */
/* @@ -13,6 +13,16 @@ const SingleColor = ({ rgb, weight, hex, index }) => { */
     navigator.clipboard.writeText(hexValue)
   }
 
  useEffect(() => {
    const timeout = setTimeout(() => {
      setalert(false)
    }, 3000)

    return () => {
      clearTimeout(timeout)
    }
  }, [alert])

   return (
     <article
       className={`color ${index > 10 && 'color-light'}`}
```

###### :boat: [Set the default value on load](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/bb6e436)

```jsx
/* diff --git a/react-projects/9-color-generator/setup/src/App.js b/react-projects/9-color-generator/setup/src/App.js */
/* index 18e4025..92a7878 100644 */
/* --- a/react-projects/9-color-generator/setup/src/App.js */
/* +++ b/react-projects/9-color-generator/setup/src/App.js */
/* @@ -1,13 +1,14 @@ */
 import React, { useState } from 'react'
 import SingleColor from './SingleColor'
 
// [GitHub - noeldelgado/values.js: Get the tints and shades...](https://github.com/noeldelgado/values.js)
 import Values from 'values.js'
 
 function App() {
   const defaultColor = '#f15025'
   const [color, setColor] = useState(defaultColor)
   const [error, setError] = useState(false)
//-  const [list, setList] = useState([])
  const [list, setList] = useState(new Values(defaultColor).all(10))
 
   const handleSubmit = (e) => {
     e.preventDefault()
```

## Grocery Bud

### 127. Grocery Bud - Intro

Grocery list
* Add item to list
* edit/delete an item
* use `localStorage` to persist data

:key: [Grocery Bud Complete](https://react-projects-10-grocery-bud.netlify.app/)

:key: [Setup Code](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/tree/main/react-projects/10-grocery-bud)

###### :boat: [`npm install`](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d6a120e)

### 128. Grocery Bud - Structure
###### :boat: [Skeleton layout for the app](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/ba4b542)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index 9ccd996..dcc3c44 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -3,7 +3,45 @@ import List from './List' */
 import Alert from './Alert'
 
 function App() {
//-  return <h2>grocery bud setup</h2>
  const [name, setName] = useState('')
  const [list, setList] = useState([])
  const [isEditing, setIsEditing] = useState(false)
  const [editID, setEditID] = useState(null)
  // Alert is an object to set up multiple attributes
  // type is from Bootstrap: danger or alert
  const [alert, setAlert] = useState({ show: false, msg: '', type: '' })

  const handleSubmit = (e) => {
    e.preventDefault()
    console.log('form submitted')
  }

  return (
    <section className='section-center'>
      <form className='grocery-form' onSubmit={handleSubmit}>
        {alert.show && <Alert />}
        <h3>grocery bud</h3>
        <div className='form-control'>
          <input
            type='text'
            className='grocery'
            placeholder='e.g. eggs'
            value={name}
            onChange={(e) => {
              setName(e.target.value)
            }}
          />
          <button type='submit' className='submit-btn'>
            {isEditing ? 'edit' : 'submit'}
          </button>
        </div>
      </form>
      <div className='grocery-container'>
        <List />
        <button className='clear-btn'>clear items</button>
      </div>
    </section>
  )
 }
 
 export default App
```

### 129. Grocery Bud - Add Items
###### :boat: [Add item and display in list](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/bd41aec)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index dcc3c44..3e1db66 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -13,7 +13,16 @@ function App() { */
 
   const handleSubmit = (e) => {
     e.preventDefault()
//-    console.log('form submitted')
    if (!name) {
      // display alert
    } else if (name && isEditing) {
      // deal with edit
    } else {
      // show alert
      const newItem = { id: new Date().getTime().toString(), title: name }
      setList([...list, newItem])
      setName('')
    }
   }
 
   return (
/* @@ -36,10 +45,12 @@ function App() { */
           </button>
         </div>
       </form>
//-      <div className='grocery-container'>
//-        <List />
//-        <button className='clear-btn'>clear items</button>
//-      </div>
      {list.length > 0 && (
        <div className='grocery-container'>
          <List items={list} />
          <button className='clear-btn'>clear items</button>
        </div>
      )}
     </section>
   )
 }
```

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/List.js b/react-projects/10-grocery-bud/setup/src/List.js */
/* index 127c483..ba0ea52 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/List.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/List.js */
/* @@ -1,7 +1,26 @@ */
 import React from 'react'
 import { FaEdit, FaTrash } from 'react-icons/fa'
//-const List = () => {
//-  return <h2>list component</h2>
const List = ({ items }) => {
  return (
    <div className='grocery-list'>
      {items.map((item) => {
        const { id, title } = item
        return (
          <article key={id} className='grocery-item'>
            <p className='title'>{title}</p>
            <div className='btn-container'>
              <button className='edit-btn'>
                <FaEdit />
              </button>
              <button className='delete-btn'>
                <FaTrash />
              </button>
            </div>
          </article>
        )
      })}
    </div>
  )
 }
 
 export default List
```

###### :boat: [pre-populate list for testing purposes](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/020a887)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index 3e1db66..b3c67f2 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -25,6 +25,14 @@ function App() { */
     }
   }
 
  /* TODO: Only used to pre-populate list for testing. DELETE when done */
  useEffect(() => {
    setList([
      { id: 0, title: 'eggs' },
      { id: 1, title: 'ham' },
    ])
  }, [])

   return (
     <section className='section-center'>
       <form className='grocery-form' onSubmit={handleSubmit}>
```


### 130. Grocery Bud - Alert
###### :boat: [Display alert when empty item name is submitted](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/ff76d5e)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/Alert.js b/react-projects/10-grocery-bud/setup/src/Alert.js */
/* index cedd90c..f42231c 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/Alert.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/Alert.js */
/* @@ -1,7 +1,7 @@ */
 import React, { useEffect } from 'react'
 
//-const Alert = () => {
//-  return <h2>alert component</h2>
const Alert = ({ type, msg }) => {
  return <p class={`alert alert-${type}`}>{msg}</p>
 }
 
 export default Alert
```

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index b3c67f2..fb12310 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -7,14 +7,13 @@ function App() { */
   const [list, setList] = useState([])
   const [isEditing, setIsEditing] = useState(false)
   const [editID, setEditID] = useState(null)
//-  // Alert is an object to set up multiple attributes
//-  // type is from Bootstrap: danger or alert
  // type is from Bootstrap: danger or success
   const [alert, setAlert] = useState({ show: false, msg: '', type: '' })
 
   const handleSubmit = (e) => {
     e.preventDefault()
     if (!name) {
//-      // display alert
      showAlert(true, 'please enter a value', 'danger')
     } else if (name && isEditing) {
       // deal with edit
     } else {
/* @@ -25,6 +24,10 @@ function App() { */
     }
   }
 
  const showAlert = (show = false, msg = '', type = '') => {
    setAlert({ show, type, msg })
  }

   /* TODO: Only used to pre-populate list for testing. DELETE when done */
   useEffect(() => {
     setList([
/* @@ -36,7 +39,7 @@ function App() { */
   return (
     <section className='section-center'>
       <form className='grocery-form' onSubmit={handleSubmit}>
//-        {alert.show && <Alert />}
        {alert.show && <Alert {...alert} />}
         <h3>grocery bud</h3>
         <div className='form-control'>
           <input
```

###### :boat: [Display success alert when adding a new item](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/95623cc)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/Alert.js b/react-projects/10-grocery-bud/setup/src/Alert.js */
/* index f42231c..3c69403 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/Alert.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/Alert.js */
/* @@ -1,6 +1,13 @@ */
 import React, { useEffect } from 'react'
 
//-const Alert = ({ type, msg }) => {
const Alert = ({ type, msg, removeAlert }) => {
  useEffect(() => {
    const timeout = setTimeout(() => {
      removeAlert()
    }, 3000)

    return () => clearTimeout(timeout)
  }, [])
   return <p class={`alert alert-${type}`}>{msg}</p>
 }
```

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index fb12310..600c542 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -17,13 +17,14 @@ function App() { */
     } else if (name && isEditing) {
       // deal with edit
     } else {
//-      // show alert
      showAlert(true, `${name} added to the list`, 'success')
       const newItem = { id: new Date().getTime().toString(), title: name }
       setList([...list, newItem])
       setName('')
     }
   }
 
  // by setting show = false default, I can pass it as a `remoeAlert` fn to my Alert component
   const showAlert = (show = false, msg = '', type = '') => {
     setAlert({ show, type, msg })
   }
/* @@ -39,7 +40,7 @@ function App() { */
   return (
     <section className='section-center'>
       <form className='grocery-form' onSubmit={handleSubmit}>
//-        {alert.show && <Alert {...alert} />}
        {alert.show && <Alert {...alert} removeAlert={showAlert} />}
         <h3>grocery bud</h3>
         <div className='form-control'>
           <input
```

### 131. Grocery Bud - Clear Items
###### :boat: [Clear List functionality](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/eb19cef)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index 600c542..d92de4d 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -24,6 +24,11 @@ function App() { */
     }
   }
 
  const clearList = () => {
    showAlert(true, 'empty list', 'danger')
    setList([])
  }

   // by setting show = false default, I can pass it as a `remoeAlert` fn to my Alert component
   const showAlert = (show = false, msg = '', type = '') => {
     setAlert({ show, type, msg })
/* @@ -60,7 +65,9 @@ function App() { */
       {list.length > 0 && (
         <div className='grocery-container'>
           <List items={list} />
//-          <button className='clear-btn'>clear items</button>
          <button className='clear-btn' onClick={clearList}>
            clear items
          </button>
         </div>
       )}
     </section>
```

### 132. Grocery Bud - Remove Item
###### :boat: [Remove an item](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/93510bc)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index d92de4d..4e6f6bb 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -29,6 +29,11 @@ function App() { */
     setList([])
   }
 
  const removeItem = (id) => {
    showAlert(true, 'item removed', 'success')
    setList(list.filter((item) => item.id !== id))
  }

   // by setting show = false default, I can pass it as a `remoeAlert` fn to my Alert component
   const showAlert = (show = false, msg = '', type = '') => {
     setAlert({ show, type, msg })
/* @@ -64,7 +69,7 @@ function App() { */
       </form>
       {list.length > 0 && (
         <div className='grocery-container'>
//-          <List items={list} />
          <List items={list} removeItem={removeItem} />
           <button className='clear-btn' onClick={clearList}>
             clear items
           </button>
```

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/List.js b/react-projects/10-grocery-bud/setup/src/List.js */
/* index ba0ea52..6b8d641 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/List.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/List.js */
/* @@ -1,6 +1,6 @@ */
 import React from 'react'
 import { FaEdit, FaTrash } from 'react-icons/fa'
//-const List = ({ items }) => {
const List = ({ items, removeItem }) => {
   return (
     <div className='grocery-list'>
       {items.map((item) => {
/* @@ -12,7 +12,7 @@ const List = ({ items }) => { */
               <button className='edit-btn'>
                 <FaEdit />
               </button>
//-              <button className='delete-btn'>
              <button className='delete-btn' onClick={() => removeItem(id)}>
                 <FaTrash />
               </button>
             </div>
```

### 133. Grocery Bud - Edit Item
###### :boat: [Edit items](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/b22dae8)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index 49a2788..ee1e612 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -15,7 +15,18 @@ function App() { */
     if (!name) {
       showAlert(true, 'please enter a value', 'danger')
     } else if (name && isEditing) {
//-      // deal with edit
      setList(
        list.map((item) => {
          if (item.id === editID) {
            return { ...item, title: name }
          }
          setEditID(null)
          setIsEditing(false)
          setName('')
          showAlert(true, '${name} changed', 'success')
          return item
        })
      )
     } else {
       showAlert(true, `${name} added to the list`, 'success')
       const newItem = { id: new Date().getTime().toString(), title: name }
/* @@ -34,6 +45,13 @@ function App() { */
     setList(list.filter((item) => item.id !== id))
   }
 
  const editItem = (id) => {
    const editingItem = list.find((item) => item.id === id)
    setIsEditing(true)
    setEditID(id)
    setName(editingItem.title)
  }

   // by setting show = false default, I can pass it as a `remoeAlert` fn to my Alert component
   const showAlert = (show = false, msg = '', type = '') => {
     setAlert({ show, type, msg })
/* @@ -69,7 +87,7 @@ function App() { */
       </form>
       {list.length > 0 && (
         <div className='grocery-container'>
//-          <List items={list} removeItem={removeItem} />
          <List items={list} removeItem={removeItem} editItem={editItem} />
           <button className='clear-btn' onClick={clearList}>
             clear items
           </button>
```

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/List.js b/react-projects/10-grocery-bud/setup/src/List.js */
/* index 6b8d641..106c0f8 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/List.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/List.js */
/* @@ -1,6 +1,6 @@ */
 import React from 'react'
 import { FaEdit, FaTrash } from 'react-icons/fa'
//-const List = ({ items, removeItem }) => {
const List = ({ items, removeItem, editItem }) => {
   return (
     <div className='grocery-list'>
       {items.map((item) => {
/* @@ -9,7 +9,7 @@ const List = ({ items, removeItem }) => { */
           <article key={id} className='grocery-item'>
             <p className='title'>{title}</p>
             <div className='btn-container'>
//-              <button className='edit-btn'>
              <button className='edit-btn' onClick={() => editItem(id)}>
                 <FaEdit />
               </button>
               <button className='delete-btn' onClick={() => removeItem(id)}>
```

###### :boat: [BUGFIX: Alert timeout doesnt get restarted when a new alert happens](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/d36e2bf)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/Alert.js b/react-projects/10-grocery-bud/setup/src/Alert.js */
/* index 3c69403..65ea996 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/Alert.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/Alert.js */
/* @@ -1,13 +1,13 @@ */
 import React, { useEffect } from 'react'
 
//-const Alert = ({ type, msg, removeAlert }) => {
const Alert = ({ type, msg, removeAlert, list }) => {
   useEffect(() => {
     const timeout = setTimeout(() => {
       removeAlert()
     }, 3000)
 
     return () => clearTimeout(timeout)
//-  }, [])
  }, [list])
   return <p class={`alert alert-${type}`}>{msg}</p>
 }
```

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index 4e6f6bb..49a2788 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -50,7 +50,7 @@ function App() { */
   return (
     <section className='section-center'>
       <form className='grocery-form' onSubmit={handleSubmit}>
//-        {alert.show && <Alert {...alert} removeAlert={showAlert} />}
        {alert.show && <Alert {...alert} removeAlert={showAlert} list={list} />}
         <h3>grocery bud</h3>
         <div className='form-control'>
           <input
```

### 134. Grocery Bud - Local Storage
###### :boat: [Store list to localStorage and restore](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/202a58e)

```jsx
/* diff --git a/react-projects/10-grocery-bud/setup/src/App.js b/react-projects/10-grocery-bud/setup/src/App.js */
/* index ee1e612..a6f299c 100644 */
/* --- a/react-projects/10-grocery-bud/setup/src/App.js */
/* +++ b/react-projects/10-grocery-bud/setup/src/App.js */
/* @@ -2,9 +2,16 @@ import React, { useState, useEffect } from 'react' */
 import List from './List'
 import Alert from './Alert'
 
const getLocalStorage = () => {
  let list = localStorage.getItem('list')
  if (list) {
    return JSON.parse(localStorage.getItem('list'))
  } else return []
}

 function App() {
   const [name, setName] = useState('')
//-  const [list, setList] = useState([])
  const [list, setList] = useState(getLocalStorage)
   const [isEditing, setIsEditing] = useState(false)
   const [editID, setEditID] = useState(null)
   // type is from Bootstrap: danger or success
/* @@ -57,12 +64,17 @@ function App() { */
     setAlert({ show, type, msg })
   }
 
  useEffect(() => {
    localStorage.setItem('list', JSON.stringify(list))
  }, [list])

   /* TODO: Only used to pre-populate list for testing. DELETE when done */
   useEffect(() => {
//-    setList([
//-      { id: 0, title: 'eggs' },
//-      { id: 1, title: 'ham' },
//-    ])
    if (list.length === 0)
      setList([
        { id: 0, title: 'eggs' },
        { id: 1, title: 'ham' },
      ])
   }, [])
 
   return (
```

## NavBar

### 135. Navbar - Intro

[Navbar - Completed](https://react-projects-11-navbar.netlify.app/)

###### :boat: [npm install](https://github.com/arafatm/learn-udemy-react-tutorial-and-projects-course/commit/2015f28)

xxx

### 136. Navbar - Basic Structure
### 137. Navbar - Data
### 138. Navbar - Simple Toggle
### 139. Navbar - Class Toggle
### 140. Navbar - useRef
### 141. Sidebar/Modal - Intro
### 142. Sidebar/Modal - Structure
### 143. Sidebar/Modal - Context
### 144. Sidebar/Modal - Complete
### 145. Stripe - Intro
### 146. Stripe - Context Boilerplate
### 147. Stripe - Navbar
### 148. Stripe - Hero
### 149. Stripe - Sidebar
### 150. Stripe - Submenu
### 151. Stripe - Location
### 152. Stripe - Links
### 153. Stripe - Hide Submenu
### 154. Cart - Intro
### 155. Cart - Setup Overview
### 156. Cart - useReducer Setup
### 157. Cart - Clear Cart
### 158. Cart - Remove Single Item
### 159. Cart - Increase
### 160. Cart - Decrease
### 161. Cart - Get Totals
### 162. Cart - Fetch Data
### 163. Cart - Toggle Amount
### 164. Cocktails - Intro
### 165. Cocktails - Additional Info
### 166. Cocktails - Setup Overview
### 167. Cocktails - React Router Setup
### 168. Cocktails - Navbar
### 169. Cocktails - About and Error
### 170. Cocktails - Context API Setup
### 171. Cocktails - API Overview
### 172. Cocktails - Fetch Drinks
### 173. Cocktails - Display List
### 174. Cocktails - Search Form
### 175. Cocktails - Single Cocktail Page
### 176. Hosting (Netlify) - Drag and Drop
### 177. Hosting (Netlify) - Continuous Deployment
# Section 6: Additional Projects (API and External Libraries)
### 178. Intro
### 179. Markdown - Intro
### 180. Markdown - Setup
### 181. Markdown - Complete
### 182. Random Person - Intro
### 183. Random User - Setup
### 184. Random User - Fetch User
### 185. Random User - Buttons
### 186. Pagination- Intro
### 187. Pagination - Setup
### 188. Pagination - Fetch/Display List
### 189. Pagination - Paginate Logic
### 190. Pagination - Display Single Page
### 191. Pagination - Display Buttons
### 192. Pagination - Prev and Next Buttons
### 193. Stock Photos - Intro
### 194. Stock Photos - Setup
### 195. Stock Photos - Initial Fetch
### 196. Stock Photos - ENV VAR
### 197. Stock Photos - Display Photos
### 198. Stock Photos - Scroll Event
### 199. Stock Photos - Infinite Scroll
### 200. Stock Photos - Search Query
### 201. Stock Photos - Complete
### 202. Stock Photos - useEffect Warning Alternative
### 203. Dark Mode - Intro
### 204. Dark Mode - Setup
### 205. Dark Mode - moment.js
### 206. Dark Mode - Toggle Theme
### 207. Dark Mode - Local Storage
### 208. Movie DB - Intro
### 209. Movie DB - Setup
### 210. Movie DB - API KEY
### 211. Movie DB - React Router
### 212. Movie DB - Initial Fetch
### 213. Movie DB - Movies Component
### 214. Movie DB - Search Form
### 215. Movie DB - Single Movie
### 216. Movie DB - Refactor to useFetch
### 217. Hacker News - Intro
### 218. Hacker News - Setup
### 219. Hacker News - API Overview
### 220. Hacker News - Basic Structure
### 221. Hacker News - Fetch Stories
### 222. Hacker News - Display Stories
### 223. Hacker News - Remove Story
### 224. Hacker News - Search Form
### 225. Hacker News - Prev and Next Buttons
### 226. Quiz - Intro
### 227. Quiz - Setup
### 228. Quiz - API
### 229. Quiz - Context Setup
### 230. Quiz - Fetch Questions
### 231. Quiz - Display Question
### 232. Quiz - Next Question
### 233. Quiz - checkAnswer
### 234. Quiz - Show Modal
### 235. Quiz - Setup Form Structure
### 236. Quiz - HandleChange
### 237. Quiz - HandleSubmit
### 238. Quiz - Randomize Correct Answer
# Section 7: Search Github Users
### 239. Intro
### 240. Starter Project Link
### 241. Starter Project
### 242. Setup Info
### 243. React Router Setup
### 244. React Router Error
### 245. Error Page
### 246. Login Page
### 247. Context API
### 248. Mock Data
### 249. Info Component
### 250. Card Component
### 251. Followers Component
### 252. Repos Setup
### 253. Fusion Charts Info
### 254. First Chart
### 255. Fusion Charts API
### 256. Fusion Charts - Configuration Options
### 257. Fusion Charts - Pie Chart
### 258. Calculate Most Used Language
### 259. Fusion Charts - Responsive
### 260. Fusion Charts - Doughnut Chart
### 261. Calculate Most Popular Language
### 262. Fusion Charts - Column and Bar Charts
### 263. Stars and Forks - Functionality
### 264. Search Component
### 265. Requests
### 266. Error
### 267. Search User
### 268. Loading Spinner
### 269. Repos and Followers
### 270. Promise.allSettled()
### 271. Auth0 Info
### 272. Auth0 Setup
### 273. Login - Logout
### 274. Private Route
### 275. Wrapper
### 276. Local Storage
### 277. Deploy Gotchas
### 278. Deploy Project
### 279. Finished Project
# Section 8: E-Commerce Project
### 280. Intro
### 281. Info
### 282. Starter Install
### 283. Stater Overview
### 284. Styled Components - Basics
### 285. React Router - Setup
### 286. Navbar
### 287. Cart Buttons
### 288. Footer
### 289. Sidebar
### 290. Products Context Setup
### 291. Sidebar Toggle
### 292. Hot Reloading Fix
### 293. Error Page
### 294. About, Checkout Page
### 295. Home Page - Hero
### 296. Home Page - Services
### 297. Home Page - Contact
### 298. Formspree
### 299. API Info
### 300. Fetch Products Overview
### 301. Fetch Products Complete
### 302. Featured Products
### 303. Format Price
### 304. Fetch Single Product
### 305. Single Product - Loading, Error
### 306. Single Product - Base Return
### 307. Single Product - Product Images
### 308. Single Product - Stars (manual approach)
### 309. Single Product - Stars (array approach)
### 310. Single Product - Add To Cart Colors
### 311. Single Product - Add To Cart Amount Buttons
### 312. Filter Context Setup
### 313. Products Page - Grid View
### 314. Products Page - List View
### 315. Sort Component - Basic Setup
### 316. Sort Component - View Buttons
### 317. Sort Component - Controlled Input
### 318. Sort Functionality
### 319. Filters - Default Values
### 320. Filters - Text
### 321. Filters - Unique Values
### 322. Filters - Categories
### 323. Filters - Companies
### 324. Filters - Colors
### 325. Filters - Price
### 326. Filters - Shipping and Clear Filters
### 327. Filter Functionality - Setup and Text Input
### 328. Filter Functionality - Rest of the Filters
### 329. Cart Context Setup
### 330. AddToCart - Setup
### 331. AddToCart Reducer - New Item
### 332. AddToCart Reducer - Existing Item
### 333. Cart Page Setup
### 334. localStorage
### 335. Cart Content
### 336. Cart Columns
### 337. Cart Totals
### 338. Cart Item
### 339. Cart - Remove Item and Clear Cart
### 340. Cart - Toggle Amount
### 341. Cart - Calculate Totals
### 342. Switch React Version
### 343. Additional Auth0 Info
### 344. Auth0 - Setup
### 345. Auth0 - Provider
### 346. useContext Setup
### 347. Auth0 - Login/Logout Buttons
### 348. Auth0 - Toggle Values
### 349. Auth0 - Hide Checkout
### 350. Auth0 - Private Route
### 351. Extra Content
### 352. Install Extra Packages
### 353. AuthWrapper
### 354. Fix Warnings
### 355. Stripe and Netlify Accounts
### 356. Install and Setup netlify-cli
### 357. First Netlify Function
### 358. Stripe Checkout - Setup
### 359. Stripe Checkout - Imports
### 360. Stripe Checkout - State Variables
### 361. Stripe Checkout - Basic Return
### 362. Netlify Function - /create-payment-setup
### 363. Stripe Checkout - Get Client Secret
### 364. Stripe Checkout - Complete
### 365. Deploy To Netlify
# Section 9: Redux
### 366. Redux Intro
### 367. Starter Files
### 368. Setup Project
### 369. Quick Redux Info
### 370. Store
### 371. Reducer
### 372. getState
### 373. First Action
### 374. Return and Action Bugs
### 375. More Actions
### 376. More Complicated State
### 377. Actions as Variables
### 378. Separate Reducer
### 379. Refactor
### 380. Provider Setup
### 381. connect Navbar
### 382. connect CartContainer
### 383. dispatch - Clear Cart
### 384. Switch Statement Syntax
### 385. Reducer Setup
### 386. "REMOVE" action setup
### 387. "REMOVE" action complete
### 388. "INCREASE" and "DECREASE" action setup
### 389. "INCREASE" complete
### 390. "DECREASE" complete
### 391. "GET_TOTALS" action
### 392. Refactor "DECREASE"
### 393. "TOGGLE_AMOUNT" action
### 394. Reducer Default State
### 395. Action Creators
### 396. Redux Devtools
# Section 10: Old Content - Class Based Components
### 397. Import and Export (ES6 Modules)
### 398. Class Based Components in React
### 399. Functional VS Class Based Components
### 400. State
### 401. Alternative State Syntax
### 402. Book Mini Project
### 403. Events
### 404. this.setState
### 405. Passing Methods and "Prop Drilling"
### 406. Passing Methods to Children Components to Work with State
### 407. Conditionals in JSX
