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

@client.command() #Test for rolling function of the bot, currently using D4
async def roll4(ctx):
    dice = ['1','2','3','4']
    await ctx.send('You rolled a {}!'.format(random.choice(dice)))
    
@client.command() #Test for rolling function of the bot, currently using D4
async def race(ctx):
    race = ['Dragonborn','Dwarf','Elf','Gnome', 'Half-Elf', 'Halfing','Human']
    await ctx.send('Your race is {}!'.format(random.choice(race)))
    
@client.command()
async def classes(ctx):
    classes = ['Barbarian', 'Bard', 'Cleric', 'Druid', 'Fighter', 'Monk', 'Paladin','Ranger','Rogue', 'Sorcerer', 'Warlock', 'Wizard', 'Artificer', 'Blood Hunter']
    await ctx.send('Your class is {}!'.format(random.choice(classes)))
client.run('') #Links the code to bot app


