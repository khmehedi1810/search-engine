<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SearchData;
use App\Models\User;

class SearchDataController extends Controller
{
    public function search(Request $request){
        $table_data = [];

        if(empty($request->search) || $request->search == ''){
            return response()->json([
                'status' => 404,
                'message' => 'empty value'
            ], 404);
        }
        $table_data['search_value'] = $request->search;
        $keywords = preg_split('/(, |,| )/', $request->search);

        $result = User::where(function ($query) use ($keywords) {
            foreach ($keywords as $name) {
                $query->orWhere('name', 'like', '%' . $name . '%');
            }
        })->get();

        $table_data['keywords'] = $keywords;
        $table_data['results'] = $result;
        $table_data['search_time'] = now();

        $search = SearchData::create($table_data);

        $all_search = SearchData::where(function ($query) use ($keywords) {
            foreach ($keywords as $name) {
                $query->orWhere('keywords', 'like', '%' . $name . '%');
            }
        })->get(['keywords']);

        $keywordCounts = [];

        // Iterate through the data and count the keywords
        if($all_search){
            foreach ($all_search as $entry) {
                foreach ($entry["keywords"] as $keyword) {
                    if (in_array($keyword, $keywords)) {
                        if (array_key_exists($keyword, $keywordCounts)) {
                            $keywordCounts[$keyword]++;
                        } else {
                            $keywordCounts[$keyword] = 1;
                        }
                    }
                    
                }
            }
        }
        
        if($search){
            return response()->json([
                'status' => 200,
                'message' => 'success',
                'data' => $table_data,
                'all' => $all_search,
                'count' => $keywordCounts ?? []
            ], 200);
        }
        return response()->json([
                'status' => 400,
                'message' => 'failed'
            ], 400);
    }
}
