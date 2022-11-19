import turtle
import random
import tkinter
import numpy as ny


def MonteCarloVis(size):
    delta=380*2/(size-1)
    #used for drawing grid
    pencil=turtle.Turtle()
    pencil.hideturtle()
    pencil.penup()
    pencil.speed(speed=0)
    pencil.goto(-380,380)
    pencil.pendown()
    pencil.setheading(270)
    
    #position matrix set up
    positions_matrix=ny.zeros([size,size])
    
    for i in range(1,size-1):
        for j in range(1,size-1):
            positions_matrix[i][j]=1
    row=random.randint(2,size-2)
    col=random.randint(2,size-2)
    #node we will watch
    node=turtle.Turtle()
    node.hideturtle()
    node.penup()
    node.goto(-380,380)
    node.pencolor("blue")
    node.shape("circle")
    node.speed(4)
    node.turtlesize(0.85)
    node.width(6)

    node.setheading(0)
    node.forward(col*delta)
    node.setheading(270)
    node.forward(row*delta)
    node.setheading(0)
    node.pendown()
    # makes a square
    for i in range(4):
        pencil.forward(2*380)
        pencil.left(90)
    
    # makes the gridlines
    if size%2==0:
        for j in range(int(size/2)-1):
            pencil.forward(delta)
            pencil.setheading(0)
            pencil.forward(2*380)
            pencil.right(90)
            pencil.forward(delta)
            pencil.setheading(0)
            pencil.backward(380*2)
            pencil.setheading(270)
        pencil.forward(delta)
        pencil.setheading(0)
        for k in range(int(size/2)-1):
            pencil.forward(delta)
            pencil.setheading(90)
            pencil.forward(2*380)
            pencil.setheading(0)
            pencil.forward(delta)
            pencil.setheading(90)
            pencil.backward(2*380)
            pencil.setheading(0)


             
        
    else:
         for j in range(int(size)-2):
            pencil.forward(delta)
            pencil.setheading(0)
            pencil.forward(2*380)
            pencil.backward(2*380)
            pencil.setheading(270)
         pencil.forward(delta)
         pencil.setheading(0)
         for k in range(int(size/2)):
            pencil.forward(delta)
            pencil.setheading(90)
            pencil.forward(2*380)
            pencil.setheading(0)
            pencil.forward(delta)
            pencil.setheading(90)
            pencil.backward(2*380)
            pencil.setheading(0)
    
    
    
    #puts the node in a random position that is not within the first 3 layers
    #shouldnt use grids that are too small
    
    node.showturtle() #makes the node visable
    run=1
    while run==1:
        r=random.random()
        if r<= 0.25:
            row-=1 #move up
            node.setheading(90)
            node.forward(delta)
        elif r>0.25 and r<=0.5:
            row+=1 #move down
            node.setheading(270)
            node.forward(delta)
        elif r>0.5 and r<= 0.75:
            col-=1 #move left
            node.setheading(180)
            node.forward(delta)
        else:
            col+=1 #move right
            node.setheading(0)
            node.forward(delta)
        if int(positions_matrix[row][col])==0:
            run=-1
         
    Screen=turtle.Screen()
    Screen.exitonclick()
   

    

MonteCarloVis(25)