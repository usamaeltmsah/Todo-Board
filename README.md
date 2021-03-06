# Todo-Board

## Table of contents
* [Installation](#installation)
* [Todo Board](#todo-board)
    * [Introduction](#introduction)
    * [Commands](#commands)
    * [Usage](#usage)
    * [Demo](#demo)
    
## Installation
- It's required to install [ruby 2.7.0](https://www.ruby-lang.org/en/documentation/installation/)

    - If already installed try to get version Using *Comamnd* 
    ```bash 
    ruby -v
    ```
- It's prefered to install [pry on Ruby](https://www.sitepoint.com/pry-a-simple-start/#:~:text=To%20start%20pry%2C%20simply%20type,the%20Rails%20console%20with%20Pry.)
    - If already installed try to get version Using *Comamnd* 
    ```bash 
    pry -v
    ```
    
## Introduction
In this project I try to simulate the down image :D

<img alt="Todo-Board" src="https://miro.medium.com/max/568/1*xfUyRnZltS45gsXkVy526w.jpeg" width="500">

> **_NOTE:_** You can create many lists/boards as you need

## Commands

I tried to simplify using your board easily by some simple commands

- make a new list with the given label
    ```bash
    mklist <new_list_label>
    ```
    
- List all lists/boards names
    ```bash
    ls
    ```

- List all lists/boards

    ```bash
     showall
     ```
     
- Add a new item to the specified list with the given information

    ```bash
    mktodo <list_label> <item_title> <item_deadline> <optional_item_description>
    ```
    
- Move the specified item higher on the given list

    ```bash
    up <list_label> <item_index> <optional_amount>
    ```
    
- Move the specified item lower on the given list

    ```bash
    down <list_label> <item_index> <optional_amount>
    ```
    
- Swap the positions of the specified items on the given list

    ```bash
    swap <list_label> <item_index_1> <item_index_2>
    ```

- Print the all information for the item at the top of the given list

    ```bash
    priority <list_label>
    ```

- Sort the given list by deadline

    ```bash
    sort <list_label>
    ```

- Print all items of the given list if index is not provided
- Print the specific item of the given list if index is provided

    ```bash
    print <list_label> <optional_index>
    ```
      
- Toggle "done" for the specified item on the given list

   ```bash
   toggle <list_label> <item_index>
   ```
      
- Remove the specified item on the given list

   ```bash
   rm <list_label> <item_index>
   ```
      
- Remove all "done" items on the given list

   ```bash
   purge <list_label>
   ```
      
- Remove all "done" items on all lists

   ```bash
   purgeall
   ```
      
- Exit from the command

   ```bash
   quit
   ```

## Usage 

> **_NOTE:_** Make sure you are in the same directory of project files

open `CMD` or `Terminal`, and `cd` to the project directory

In trermial write 

```bash
pry
```
then in pry write

```ruby
load 'todo_board.rb'
```
It works!! :smiley:

Use up **commands** to manage your boards 

## Demo 

```ruby
Enter a command: mklist groceries
Enter a command: mklist tech
Enter a command: ls
 groceries
 tech

Enter a command: mktodo groceries butter 2019-10-24
Enter a command: mktodo groceries milk 2019-10-23
Enter a command: mktodo groceries candy 2019-10-31 sugar-free
Enter a command: mktodo groceries toothpaste 2019-10-29
Enter a command: print groceries
-------------------------------------------------
                GROCERIES
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | butter               | 2019-10-24 | [ ]
1     | milk                 | 2019-10-23 | [ ]
2     | candy                | 2019-10-31 | [ ]
3     | toothpaste           | 2019-10-29 | [ ]
-------------------------------------------------

Enter a command: print groceries 2
-------------------------------------------------
candy                           2019-10-31    [ ]
sugar-free
-------------------------------------------------

Enter a command: mktodo tech ruby 2019-10-24
Enter a command: mktodo tech rails 2019-11-02
Enter a command: mktodo tech javascript 2019-11-30
Enter a command: showall
-------------------------------------------------
                GROCERIES
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | butter               | 2019-10-24 | [ ]
1     | milk                 | 2019-10-23 | [ ]
2     | candy                | 2019-10-31 | [ ]
3     | toothpaste           | 2019-10-29 | [ ]
-------------------------------------------------
-------------------------------------------------
                TECH
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | ruby                 | 2019-10-24 | [ ]
1     | rails                | 2019-11-02 | [ ]
2     | javascript           | 2019-11-30 | [ ]
-------------------------------------------------

Enter a command: toggle groceries 1
Enter a command: toggle groceries 3
Enter a command: toggle tech 2
Enter a command: showall
-------------------------------------------------
                GROCERIES
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | butter               | 2019-10-24 | [ ]
1     | milk                 | 2019-10-23 | [✓]
2     | candy                | 2019-10-31 | [ ]
3     | toothpaste           | 2019-10-29 | [✓]
-------------------------------------------------
-------------------------------------------------
                TECH
-------------------------------------------------
Index | Item                 | Deadline   | Done
-------------------------------------------------
0     | ruby                 | 2019-10-24 | [ ]
1     | rails                | 2019-11-02 | [ ]
2     | javascript           | 2019-11-30 | [✓]
-------------------------------------------------
```
