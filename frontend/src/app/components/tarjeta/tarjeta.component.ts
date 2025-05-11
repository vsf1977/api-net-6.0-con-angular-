import { Component, OnInit } from '@angular/core';
import { DataService } from '../../services/data.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-tarjeta',
  imports : [ CommonModule ],
  templateUrl: './tarjeta.component.html',
  styleUrls: ['./tarjeta.component.css']
})
export class TarjetaComponent implements OnInit {

  items: any[] = [];
  ruta : string = '';
  constructor(public dataService: DataService) { }

  cargar(ruta : string){    
    this.dataService.getAll(ruta).subscribe((data) =>  {
      this.items = data;      
      console.log(data)
      if (!data.length) 
        alert('No hay registros para mostrar');      
    });
  }

  ngOnInit(): void {   
    this.dataService.recibir.subscribe((ruta) =>{
      this.items = [];      
      this.ruta = ruta;
      this.cargar(ruta);      
    })
  }

  borrar(id : any){
    this.dataService.delete(this.ruta,id).subscribe((data) =>  {
        this.cargar(this.ruta);
        if(data != 1)
        {
          alert("Ocurrio un error al borrar el registro");
        }
    });
  }

}