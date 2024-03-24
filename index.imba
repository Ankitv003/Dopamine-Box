import {nanoid} from 'nanoid'
import {persistData, loadData, clearData} from './persist.imba'
import "./habit-group.imba"
import "./habit-item.imba"
import "./habit-adder.imba"
import {Howl} from 'howler'

global css
	@root
		$panel-space:30px @lt-sm:15px
		$icon-radius:15px @lt-sm:8px
		$icon-space:10px @lt-sm:5px
		$icon-size:70px @lt-sm:44px
		$default-speed:350ms
		$default-ease:ease
		$default-tween:all $default-speed $default-ease
	body bgc:yellow2

tag dopamine-box
	prop habits = loadData()
	prop showAdder = false
	prop celebrateSound = new Howl({src: './celebrate.mp3'})
	
	def persist
		persistData(habits)
	
	def toggleAdder
		showAdder = !showAdder
	
	def resetAll
		for habit in habits
			habit.done = false
		persist()
	
	def handleHabitAdded e
		const newHabit = {name: e.detail, done: false, id:nanoid()}
		habits.push(newHabit)
		persist()
	
	def deleteItem e
		const idToDelete = e.detail
		habits = habits.filter do(h) h.id !== idToDelete
		persist()

	def toggleItem e
		const idToToggle = e.detail
		let remaining = 0
		for habit in habits
			if habit.id === idToToggle
				habit.done = !habit.done
			remaining++ unless habit.done
		if remaining === 0
			celebrateSound.play()
		persist()
	
	def handleClearData
		clearData()
		habits = []
	
	css .container inset:0px d:vflex jc:center ai:stretch 
		.panel-area d:vflex ja:center flg:1 mt:0 mb:$panel-space pt:$panel-space 
			.controls mt:20px d:flex g:10px bgc:pink1
				button bgc:transparent bgc@hover:skyblue c@hover:black fs:lg color:cooler4 cursor:pointer
		.chooser-area tween:$default-tween h:0 pos:relative of:hidden  
			&.on h:100%
			.chooser display:hidden 
			
		button rd:md
	def setup
		if habits.length === 0
			showAdder = true
			
	def render
		<self>
			<div.container>
				<div.panel-area>
					<habit-group
						@deleteItem=deleteItem
						@toggleItem=toggleItem
						habits=habits
					>
							
					<div.controls>
						<button @click=toggleAdder> "Toggle"
						<button @click=resetAll> "Reset All"
						<button @click=handleClearData> "Clear Data"
			
				<div.chooser-area .on=showAdder>
					<div.chooser>
						<habit-adder @habitAdded=handleHabitAdded>	
			

imba.mount <dopamine-box>