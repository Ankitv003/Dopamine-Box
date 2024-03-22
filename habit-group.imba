tag habit-group
	prop habits = []
	
	css .group tween:gap 200ms ease
		d:flex g:10px g@xs:30px jc:center
		&.empty rd:md shadow:0 0 0 2px cooler2

	def render
		const empty? = habits.length === 0
		<self>
			<div.group .empty=empty?>
				if empty?
					<habit-item [visibility:hidden pe:none]>
				for habit, i in habits
					<habit-item
						key=habit.id
						id=habit.id
						name=habit.name
						done=habit.done
					>

