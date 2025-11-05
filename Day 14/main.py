import sys
import math

class Robot:
    def __init__(self, p, v, width, height):
        """
        :param p: the position of the robot x,y (position in tiles)
        :param v: the velocity of the robot x,y (velocity in tiles/second)
        """
        self.x = int(p.split(',')[0].strip())
        self.y = int(p.split(',')[1].strip())
        self.vx = int(v.split(',')[0].strip())
        self.vy = int(v.split(',')[1].strip())
        self.width = width
        self.height = height

    def __str__(self):
        return "Robot pos: [{},{}], vel: [{},{}]".format(self.x, self.y, self.vx, self.vy)

    def move(self, seconds):
        tiles_x = self.vx * seconds
        tiles_y = self.vy * seconds

        if tiles_x < 0:
            self.x = (self.width - ((abs(tiles_x) - (self.x + 1)) % self.width)) % self.width
        else:
            self.x = (self.x + 1 + tiles_x) % self.width

        if tiles_y < 0:
            self.y = (self.height - ((abs(tiles_y) - (self.y + 1)) % self.height)) % self.height
        else:
            self.y = ((self.y + 1) + tiles_y) % self.height

    def get_quadrant(self):
        mid_heigth = ((self.height) / 2).__ceil__()
        mid_width = ((self.width) / 2).__ceil__()
        if (self.x + 1) != mid_width or (self.y + 1) != mid_heigth:
            if (self.x + 1) < mid_width and (self.y + 1) < mid_heigth:
                return 1
            elif (self.x + 1) > mid_width and (self.y + 1) < mid_heigth:
                return 2
            elif (self.x + 1) < mid_width and (self.y + 1) > mid_heigth:
                return 3
            elif (self.x + 1) > mid_width and (self.y + 1) > mid_heigth:
                return 4
            else:
                return 0
        else:
            return 0



def read_input(filepath):
    # Open text file filepath and read contents
    with open(filepath) as f:
        lines = f.readlines()
    return lines

def make_robots(lines, width, height):
    robots = []
    for line in lines:
        p = line.split(' ')[0].split('=')[1]
        v = line.split(' ')[1].split('=')[1]
        robots.append(Robot(p, v, width, height))
    return robots

def move_robots(robots, seconds):
    for robot in robots:
        robot.move(seconds)

def get_quadrants(robots):
    quadrants = [0, 0, 0, 0]
    for robot in robots:
        quadrant = robot.get_quadrant()
        if quadrant != 0:
            quadrants[quadrant - 1] += 1
    return quadrants

def get_safety_factor(robots):
    quadrants = get_quadrants(robots)

    return math.prod(quadrants)

def print_map(robots):
    grid = [[0] * robots[0].width for _ in range(robots[0].height)]
    print(grid)
    for robot in robots:
        try:
            grid[robot.y][robot.x] += 1
        except:
            print(robot)
            exit(1)
    for row in grid:
        for col in row:
            if col == 0:
                col = "."
    for row in grid:
        print(row)


def main():
    lines = read_input("./input.txt")
    width = 11
    height = 7
    seconds = 100
    robots = make_robots(lines, width, height)
    for robot in robots:
        print(robot)
    move_robots(robots, seconds)
    print(f"Safety factor: {get_safety_factor(robots)}, {get_quadrants(robots)}")
    print_map(robots)

if __name__ == '__main__':
    main()