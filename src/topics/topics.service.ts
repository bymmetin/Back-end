import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../supabase/supabase.service';

@Injectable()
export class TopicsService {
  constructor(private supabase: SupabaseService) {}

  async getTopics() {
    const { data, error } = await this.supabase
      .getClient()
      .from('topics')
      .select('*')
      .order('order_num', { ascending: true });

    if (error) throw new Error(error.message);
    return data;
  }
}
