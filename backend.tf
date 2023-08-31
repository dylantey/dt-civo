terraform {
	backend "remote" {
		organization = "dylantey" # org name from step 2.
		workspaces {
			name = "dt-civo" # name for your app's state.
		}
	}
}
