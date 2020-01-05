---
layout: default  
title: Přerov - Volební období 2018-2022 - 8. zasedání  
permalink: /prerov/volebni-obdobi-2018-2022/zasedani-08/  
---
{% assign hlasovani = site.data.prerov.volebni_obdobi_2018_2022.zasedani_08.hlasovani | sort: 'cislo' %}
{% assign ucastnici = site.data.prerov.volebni_obdobi_2018_2022.zasedani_08.ucastnici | sort: 'strana' %}

[Úvod](../../../) > [Přerov](../../) > [Volební období 2018-2022](../) > 8. zasedání

# 8. zasedání

## Celkový přehled hlasování

<table border="1">
  <tr>   
    <th>Název hlasování</th>
    {% for h in hlasovani %}
    <th>{{ h.nazev }}</th>
    {% endfor %}
  </tr>
  <tr> 
    <th>Číslo hlasování</th>
    {% for h in hlasovani %}
    <th>{{ h.cislo }}</th>
    {% endfor %}
  </tr>
  <tr>  
    <th>Datum</th>
    {% for h in hlasovani %}
    <th>{{ h.datum_a_cas | date: '%d.%m.%Y' }}</th>
    {% endfor %}
  </tr>
  <tr>   
    <th>Čas</th>
    {% for h in hlasovani %}
    <th>{{ h.datum_a_cas  | date: '%H:%m' }}</th>
    {% endfor %}
  </tr> 
  
  {% for u in ucastnici %}
  <tr>
    <td><a href="#{{ u.zkratka }}">{{ u.jmeno }} ({{ u.strana }})</a></td>    
    {% for h in hlasovani %}
    <td>{{ h[u.zkratka] }}</td>
    {% endfor %}
  </tr>
  {% endfor %}
</table>

## Jak hlasovali jednotliví zastupitelé

{% for u in ucastnici %}
  <a id="{{ u.zkratka }}"></a>
  <h3> {{ u.jmeno }} ({{ u.strana }}) </h3>
  <table border="1">
    <tr>
      <th>Název hlasování</th>
      <th>Číslo hlasování</th>
      <th>Hlas</th>
    </tr>
    {% for h in hlasovani %}
    <tr>
      <td>{{ h.nazev }}</td>
      <td>{{ h.cislo }}</td>
      <td>{{ h[u.zkratka] }}</td>
    </tr>
    {% endfor %}  
</table>
{% endfor %}