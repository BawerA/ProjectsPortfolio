import discord
import random
from discord.ext import commands

#client = commands.Bot(command_prefix = '.') #changing the prefix for the commands
intents = discord.Intents(messages = True, guilds = True, reactions = True, members = True, presences = True)
client = commands.Bot(command_prefix = '.', intents = intents)

@client.event #Client is named from the line above
async def on_ready(): #When the bot has all information -- it puts it still in a ready state
    print('Bot is ready.')
   
@client.event
async def on_member_join(member): #When someone joins the server
    print(f'{member} has joined a server.')
    
@client.event
async def on_member_remove(member): #When someone leaves the server
    print(f'{member} has left the server.')

@client.command() #Filler to add later for DND BOT, will send all commands to user
async def helpme(ctx):
    await ctx.send('Hey there! I am a Dungeons and Dragons Bot that will help you create a character!')
    

#Dice rolls are below

@client.command() #Test for rolling function of the bot, currently using D4
async def roll2(ctx):
    dice_roll2 = ['1','2']
    await ctx.send('You rolled a {}!'.format(random.choice(dice_roll2)))

@client.command() #Test for rolling function of the bot, currently using D4
async def roll4(ctx):
    dice = ['1','2','3','4']
    await ctx.send('You rolled a {}!'.format(random.choice(dice)))
    
@client.command() #Test for rolling function of the bot, currently using D4
async def roll6(ctx):
    dice1 = ['1','2','3','4','6']
    await ctx.send('You rolled a {}!'.format(random.choice(dice1)))

@client.command() #Test for rolling function of the bot, currently using D4
async def roll8(ctx):
    dice2 = ['1','2','3','4','6','7','8']
    await ctx.send('You rolled a {}!'.format(random.choice(dice2)))
    
@client.command() #Test for rolling function of the bot, currently using D4
async def roll10(ctx):
    dice3 = ['1','2','3','4','6','7','8', '9','10']
    await ctx.send('You rolled a {}!'.format(random.choice(dice3)))
    
@client.command() #Test for rolling function of the bot, currently using D4
async def roll12(ctx):
    dice4 = ['1','2','3','4','6','7','8', '9','10','11','12']
    await ctx.send('You rolled a {}!'.format(random.choice(dice4)))
    
@client.command() #Test for rolling function of the bot, currently using D4
async def roll20(ctx):
    dice5 = ['1','2','3','4','6','7','8', '9','10','11','12','13','14','15','16','17','18','19','20']
    await ctx.send('You rolled a {}!'.format(random.choice(dice5)))

#Below are the rolls for races and classes
    
@client.command() #Test for rolling function of the bot, currently using D4
async def race(ctx):
    race = ['Dragonborn','Dwarf','Elf','Gnome', 'Half-Elf', 'Halfing','Human']
    await ctx.send('Your race is {}!'.format(random.choice(race)))
    
@client.command()
async def classes(ctx):
    classes = ['Barbarian', 'Bard', 'Cleric', 'Druid', 'Fighter', 'Monk', 'Paladin','Ranger','Rogue', 'Sorcerer', 'Warlock', 'Wizard', 'Artificer', 'Blood Hunter']
    await ctx.send('Your class is {}!'.format(random.choice(classes)))
   
client.run('') #Links the code to bot app


