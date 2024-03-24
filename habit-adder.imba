import {icons} from "./icons.imba"

tag habit-adder
	
	css section bgc:pink1 rd:lg
		$spacing:10px
		ofx:scroll d:grid gtc:repeat(auto-fit, minmax(50px, 1fr))
		grid-gap:$spacing p:$spacing
		button pos:relative rd:10px p:0 bgc:cooler1
		button@before content:"" pb:100% d:block
		.icon-view inset:5px d:flex ja:center
		button@focus outline:0
		button@hover bgc:cooler3/50
		button@focus shadow:0 0 0 2px cooler4/25
	
	<self>
		<section>
			for own name, icon of icons
				<button @click=emit('habitAdded', name)>
					<div.icon-view>
						<svg src=icon.svg>
