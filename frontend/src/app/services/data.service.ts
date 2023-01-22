import { EnvironmentInjector, Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { environment as env } from '../../environments/environment'
import { Avionmodel } from '../models/avion/avion.module';
import { Observable, ReplaySubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  url = env.url;
  constructor(private http: HttpClient) { }

  getAll(ruta : string): Observable<Avionmodel[]> {
    return this.http.get<Avionmodel[]>(this.url+`${ruta}/getall`);
  }

  private ruta = new ReplaySubject<string>()
  
  public get recibir() {
    return this.ruta.asObservable()
  }

  public enviar(ruta: string): void {
    this.ruta.next(ruta);
  }

}
