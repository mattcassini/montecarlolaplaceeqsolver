import turtle
import random
import tkinter


position_matrix=[[0,0,0,0,0,0],[0,1,1,1,1,0],[0,1,1,1,1,0],[0,1,1,1,1,0],[0,1,1,1,1,0],[0,0,0,0,0,0]]

#Make 6x6 grid
MC=turtle.Turtle()
MC.speed(speed=0.8)
MC.hideturtle()
marker=turtle.Turtle()
marker.hideturtle()
marker.penup()
marker.speed(speed=0)
marker.goto(-200,200)
marker.pendown()
marker.right(90)
for i in range(4):
    marker.forward(400)
    marker.left(90)
#grid crosses
for x in range(2):
    marker.forward(80)
    marker.left(90)
    marker.forward(400)
    marker.right(90)
    marker.forward(80)
    marker.left(90)
    marker.backward(400)
    marker.setheading(270)

marker.forward(80)
marker.setheading(0)

for x in range(2):
    marker.forward(80)
    marker.left(90)
    marker.forward(400)
    marker.right(90)
    marker.forward(80)
    marker.left(90)
    marker.backward(400)
    marker.setheading(0)

#figure out postion of point I want to start at for Monte Carlo 
marker.backward(160)
marker.left(90)
marker.forward(240)

#making the node we will track for Monte Carlo
MC.penup()
MC.shape(name="circle")
MC.goto(marker.pos())
MC.pendown()
MC.pencolor("blue")
MC.width(10)
MC.showturtle()

#indexes of positions relative to the matrix
row=2
col=2

#Monte Carlo simulation
for i in range(101):
    r=random.random()
    if r<= 0.25:
        row-=1 #move up
        MC.setheading(90)
        MC.forward(80)
    elif r>0.25 and r<=0.5:
        row+=1 #move down
        MC.setheading(270)
        MC.forward(80)
    elif r>0.5 and r<= 0.75:
        col-=1 #move left
        MC.setheading(180)
        MC.forward(80)
    else:
        col+=1 #move right
        MC.setheading(0)
        MC.forward(80)
    if position_matrix[row][col]==0:
        break
    else:
        pass 



Screen=turtle.Screen()
Screen.exitonclick()



 
