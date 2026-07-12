return {
  	"karb94/neoscroll.nvim",
  	opts = {
	    mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
        	'<C-u>', '<C-d>',
        	'<C-b>', '<C-f>',
        	'<C-y>', '<C-e>',
        	'zt', 'zz', 'zb',
    	},	
	   
        stiffness = 0.5,
    	trailing_stiffness = 0.5,
    	matrix_pixel_threshold = 0.5,
  },
}
