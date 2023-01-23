import { EnvironmentInjector, Injectable } from '@angular/core';
import { HttpClient, HttpParams, HttpResponse } from '@angular/common/http';
import { environment as env } from '../../environments/environment'
import { Avionmodel } from '../models/avion/avion.module';
import { Observable, ReplaySubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  url = env.url;
  constructor(private http: HttpClient) { }

  getAll(ruta : string): Observable<any[]> {
    return this.http.get<any[]>(this.url+`${ruta}/getall`);
  }

  delete(ruta : string,id : string): Observable<any> {
    let queryParams = new HttpParams();
    queryParams = queryParams.append("id",id);
    return this.http.delete<any>(this.url+`${ruta}/delete`,{params:queryParams});
  }

  private ruta = new ReplaySubject<string>()
  
  public get recibir() {
    return this.ruta.asObservable()
  }

  public enviar(ruta: string): void {
    this.ruta.next(ruta);
  }

}
