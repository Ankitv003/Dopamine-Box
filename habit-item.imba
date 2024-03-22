import {icons} from "./icons.imba"

tag habit-item
	prop name = "Untitled"
	prop done = false
	prop id

	css .actions d:flex jc:space-between
		button fs:xxs c:cooler4 @hover:blue5 bgc:transparent px:0
	css input[type=text] w:100% c:cool5 ta:center rd:sm
	css .item tween:all 200ms ease
		c:cool5 fw:500
		fs:xs rd:xl p:5px
		size:70px @xs:90px
		bgc:cooler2
		d:vflex g:5px ja:center
		bgc:cooler2
		&.done bgc:emerald5 c:white

	<self>
		<button.item
			@dblclick=emit("deleteItem", id)
			@click=emit("toggleItem", id)
			.done=done
			
		>
			<svg src=icons[name]..svg>
		