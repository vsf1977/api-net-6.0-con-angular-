import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';



@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ]
})
export class AvionModule { }


export class Avionmodel {
  id: string | undefined
  matricula: string | undefined
  fabricante : string | undefined
}
